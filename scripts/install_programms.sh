#!/usr/bin/env bash
# ==============================================================
#  Раскладывает AppImage-программы из репо по системе.
#
#    Applications/*.AppImage       -> $TARGET_HOME/Applications/
#    Applications/desktop_files/*  -> $TARGET_HOME/.local/share/applications/
#
#  В desktop-файлах /home/valtrynx переписывается на целевой дом,
#  а Exec ведётся на стабильный симлинк <app>.AppImage (без версии
#  в имени), поэтому новые версии AppImage не ломают ярлыки.
#
#  Запуск:
#    bash scripts/install_programms.sh                       (себе, $HOME)
#    TARGET_HOME=/mnt/home/devastator bash scripts/...       (root, из install.sh)
# ==============================================================
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_BIN="$REPO_DIR/Applications"
SRC_DESKTOP="$SRC_BIN/desktop_files"
TARGET_HOME="${TARGET_HOME:-$HOME}"

DST_BIN="$TARGET_HOME/Applications"
DST_DESKTOP="$TARGET_HOME/.local/share/applications"

[[ -d "$SRC_BIN" ]] || { echo "Нет каталога $SRC_BIN — запускай из репозитория"; exit 1; }

mkdir -p "$DST_BIN" "$DST_DESKTOP"
shopt -s nullglob

echo "==> AppImage -> $DST_BIN"
APPIMAGES=("$SRC_BIN"/*.AppImage)
if [[ ${#APPIMAGES[@]} -eq 0 ]]; then
    echo "   (AppImage не найдены)"
fi
for img in "${APPIMAGES[@]}"; do
    name="$(basename "$img")"
    echo "   $name"
    cp -f "$img" "$DST_BIN/$name"
    chmod 755 "$DST_BIN/$name"
    # стабильное имя: figcraft-0.10.0-linux-x86_64.AppImage -> figcraft.AppImage
    stable="$(printf '%s' "$name" | sed -E 's/-[0-9][0-9.]*[^/]*\.AppImage$/.AppImage/')"
    if [[ "$stable" != "$name" ]]; then
        ln -sfn "$name" "$DST_BIN/$stable"
    fi
done

echo "==> desktop-файлы -> $DST_DESKTOP"
for d in "$SRC_DESKTOP"/*.desktop; do
    base="$(basename "$d")"
    app="${base%.desktop}"
    # 1) дом пользователя: /home/valtrynx -> $TARGET_HOME
    # 2) Exec ведём на симлинк без версии: .../app-0.1.0-...AppImage -> .../app.AppImage
    sed -E -e "s|/home/valtrynx|$TARGET_HOME|g" \
        -e "s|(/Applications/)${app}-[0-9][^/\"[:space:]]*\.AppImage|\1${app}.AppImage|g" \
        "$d" > "$DST_DESKTOP/$base"
    echo "   $base"
done

shopt -u nullglob

command -v update-desktop-database >/dev/null 2>&1 \
    && update-desktop-database "$DST_DESKTOP" 2>/dev/null || true

echo "==> Готово: $DST_BIN и $DST_DESKTOP"
