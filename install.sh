#!/usr/bin/env bash
# ==============================================================
#  Автоустановка NixOS для devastator с живого ISO.
#  Запуск: sudo bash install.sh   (из склонированного репозитория)
#
#  Что делает:
#    1) размечает выбранный диск: 1GiB EFI + остальное ext4
#    2) генерирует hardware-configuration.nix под ЭТОТ диск
#       и подменяет его в локальной копии репо (твой не трогается,
#       а у друга он выпадает из git через skip-worktree)
#    3) nixos-install --flake .#devastator
#    4) кладёт репо в /home/devastator/nixos-files и раскладывает
#       AppImage-программы (scripts/install_programms.sh)
#
#  ВНИМАНИЕ: выбранный диск будет ПОЛНОСТЬЮ СТЁРТ.
#  Требуется интернет и UEFI-загрузка ISO.
# ==============================================================
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLAKE_DIR="$REPO_DIR/nixos"
HOST="devastator"
NEW_USER="devastator"

# репо может лежать на той же флешке, что и ISO (Ventoy) — если раздел
# примонтирован read-only, скрипту туда писать (hardware-configuration.nix)
if [[ ! -w "$FLAKE_DIR" ]]; then
    echo "==> $FLAKE_DIR только для чтения, пробую remount,rw"
    mount -o remount,rw "$FLAKE_DIR" 2>/dev/null || true
    [[ -w "$FLAKE_DIR" ]] || { echo "Нет прав на запись в $FLAKE_DIR."; exit 1; }
fi

# flakes нужны уже на живом ISO
export NIX_CONFIG="experimental-features = nix-command flakes"

[[ $EUID -eq 0 ]] || { echo "Запусти через sudo: sudo bash install.sh"; exit 1; }

echo "=== Диски в системе: ==="
DISKS="$(lsblk -dpn -o NAME,SIZE,MODEL,TYPE | grep ' disk$' || true)"
[[ -n "$DISKS" ]] || { echo "Диски не найдены."; exit 1; }
echo "$DISKS"

read -rp "Какой диск целиком форматировать (например /dev/nvme0n1)? " DISK
[[ -b "$DISK" ]] || { echo "Нет такого блочного устройства: $DISK"; exit 1; }
read -rp "ВНИМАНИЕ: '$DISK' будет стёрт целиком. Набери путь ещё раз для подтверждения: " CONFIRM
[[ "$CONFIRM" == "$DISK" ]] || { echo "Отмена."; exit 1; }

case "$DISK" in
  *nvme*|*mmcblk*) P1="${DISK}p1"; P2="${DISK}p2" ;;
  *)               P1="${DISK}1";  P2="${DISK}2"  ;;
esac

echo "==> Разметка GPT: EFI 1GiB + остальное под корень"
sfdisk "$DISK" <<EOF
label: gpt
name="EFISYS", size=1GiB, type=uefi
name="ROOT", type=linux
EOF

echo "==> Форматирование"
wipefs -a "$P1" "$P2"
mkfs.vfat -F32 -n NIXOS-BOOT "$P1"
mkfs.ext4 -F -L nixos "$P2"

echo "==> Монтирование"
mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/NIXOS-BOOT /mnt/boot

echo "==> Генерация hardware-configuration.nix под этот диск"
nixos-generate-config --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix "$FLAKE_DIR/hardware-configuration.nix"

echo "==> Установка системы (это долго: качает nixpkgs и собирает quickshell)"
nixos-install --flake "$FLAKE_DIR#${HOST}" --root /mnt

echo "==> Кладём репо пользователю ${NEW_USER} для будущих обновлений"
mkdir -p "/mnt/home/${NEW_USER}"
cp -a "$REPO_DIR" "/mnt/home/${NEW_USER}/nixos-files"
# его локальный hardware-configuration.nix не должен конфликтовать при git pull
git -C "/mnt/home/${NEW_USER}/nixos-files" update-index --skip-worktree nixos/hardware-configuration.nix 2>/dev/null || true
if [[ ! -d "$REPO_DIR/.git" ]]; then
    echo "ПРЕДУПРЕЖДЕНИЕ: в этой копии нет .git — команда update у друга не сработает."
    echo "  Залей репо на GitHub и на ISO клонируй его, либо добавь remote после установки."
fi

echo "==> Раскладываем AppImage-программы из Applications/"
TARGET_HOME="/mnt/home/${NEW_USER}" bash "$REPO_DIR/scripts/install_programms.sh"

chown -R 1000:100 "/mnt/home/${NEW_USER}"

echo
echo "=============================================================="
echo " Готово! Перезагрузка: reboot"
echo " Логин: ${NEW_USER}   Пароль: ${NEW_USER}  (сменить: passwd)"
echo " Обновление после pull: просто команда update"
echo "=============================================================="
