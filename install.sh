#!/usr/bin/env bash
# ==============================================================
#  Установка / обновление NixOS-конфига devastator.
#  Запуск из склонированного репо: sudo bash install.sh
#
#  Что делает:
#    1) проверяет, что систему можно безопасно перезаписать
#    2) делает бэкап /etc/nixos (хранятся последние 5)
#    3) копирует nixos/ в /etc/nixos, НЕ трогая
#       hardware-configuration.nix (он свой у каждой машины)
#    4) пересобирает систему; при ошибке возвращает старый /etc/nixos
#
#  Переменные для отладки:
#    TARGET=/путь   — куда ставить вместо /etc/nixos
#    DRY_RUN=1      — только собрать (nixos-rebuild build), без root
# ==============================================================
set -euo pipefail

SCRIPT="$(realpath "${BASH_SOURCE[0]}")"
REPO_DIR="$(dirname "$SCRIPT")"
TARGET="${TARGET:-/etc/nixos}"
DRY_RUN="${DRY_RUN:-0}"
HOST="devastator"
USER_NAME="devastator"
STATE_VERSION="26.05"
KEEP_BACKUPS=5

if [[ $EUID -ne 0 && "$DRY_RUN" != 1 ]]; then
    exec sudo TARGET="$TARGET" DRY_RUN="$DRY_RUN" bash "$SCRIPT" "$@"
fi

# на свежей системе flakes ещё выключены
export NIX_CONFIG="experimental-features = nix-command flakes"

die()  { echo "ОШИБКА: $*" >&2; exit 1; }
warn() { echo "ВНИМАНИЕ: $*" >&2; }

[[ -d "$REPO_DIR/nixos" ]] || die "не найдена папка $REPO_DIR/nixos — запускай install.sh из репозитория."

# первая установка = в /etc/nixos ещё конфиг от установщика, а не наш
FIRST_INSTALL=1
[[ -f "$TARGET/version" ]] && FIRST_INSTALL=0

echo "==> Проверки"
[[ -d /sys/firmware/efi ]] \
    || die "система загружена не в режиме UEFI. Переустанови NixOS, загрузив ISO в режиме UEFI (не Legacy/CSM)."

HW="$TARGET/hardware-configuration.nix"
[[ -f "$HW" ]] || die "нет $HW. Его создаёт установщик NixOS, без него ставить нельзя."
grep -q 'fileSystems."/boot"' "$HW" \
    || die "в $HW нет раздела /boot — загрузчик systemd-boot не встанет."

if ! id "$USER_NAME" &>/dev/null; then
    if [[ "$DRY_RUN" == 1 ]]; then
        warn "нет пользователя $USER_NAME (DRY_RUN, продолжаю)"
    else
        die "нет пользователя '$USER_NAME'. При установке NixOS имя пользователя должно быть именно '$USER_NAME'."
    fi
fi

if [[ $FIRST_INSTALL == 1 && -f "$TARGET/configuration.nix" ]]; then
    grep -qi 'luks' "$TARGET/configuration.nix" \
        && die "при установке включено шифрование диска — его настройки потеряются. Переустанови NixOS без шифрования."
    OLD_SV="$(grep -oP 'system\.stateVersion\s*=\s*"\K[^"]+' "$TARGET/configuration.nix" || true)"
    [[ -n "$OLD_SV" && "$OLD_SV" != "$STATE_VERSION" ]] \
        && warn "система ставилась с версии $OLD_SV, а в конфиге stateVersion = $STATE_VERSION. Обычно это не страшно."
fi

echo "==> Бэкап $TARGET"
BACKUP="$TARGET.bak-$(date +%F_%H-%M-%S)"
cp -a "$TARGET" "$BACKUP"
# удаляем старые бэкапы, оставляем последние $KEEP_BACKUPS
find "$(dirname "$TARGET")" -maxdepth 1 -name "$(basename "$TARGET").bak-*" -print0 \
    | sort -z | head -z -n "-$KEEP_BACKUPS" | xargs -0 -r rm -rf

restore() {
    echo "==> Возвращаю прежний $TARGET из $BACKUP"
    find "$TARGET" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
    cp -a "$BACKUP/." "$TARGET/"
}

echo "==> Копирование конфига в $TARGET"
# всё, кроме hardware-configuration.nix этой машины
find "$TARGET" -mindepth 1 -maxdepth 1 ! -name hardware-configuration.nix -exec rm -rf {} +
tar -C "$REPO_DIR/nixos" --exclude=./hardware-configuration.nix --exclude='*.save' -cf - . \
    | tar -C "$TARGET" --no-same-owner -xf -
cp "$REPO_DIR/version" "$TARGET/version"

# при первой установке активный рабочий стол (GNOME/KDE) исчезнет,
# поэтому не переключаемся «на ходу», а применяем со следующей загрузки
if [[ "$DRY_RUN" == 1 ]]; then
    MODE=build
elif [[ $FIRST_INSTALL == 1 ]]; then
    MODE=boot
else
    MODE=switch
fi

echo "==> nixos-rebuild $MODE (может занять долго)"
if ! nixos-rebuild "$MODE" --flake "$TARGET#$HOST"; then
    restore
    die "сборка не удалась, система не изменена. Пришли текст ошибки выше."
fi

echo
echo "=============================================================="
echo " Готово! Версия конфига: $(cat "$TARGET/version")"
if [[ "$MODE" == boot ]]; then
    echo " Перезагрузись: reboot"
    echo " Вход: логин $USER_NAME + пароль, затем команда niri-session"
fi
echo " Что-то не так после обновления — в меню загрузки выбери"
echo " предыдущую версию системы."
echo "=============================================================="
