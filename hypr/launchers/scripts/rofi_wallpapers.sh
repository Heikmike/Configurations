#!/usr/bin/env bash

case $BASH_VERSION in '' | [123].* | 4.[012])
   rofi -e "ERROR: Bash 4.3+ needed"
   exit 1
   ;;
esac

command -v fd >/dev/null 2>&1 || {
   echo >&2 "'fd' required but not installed.  Aborting."
   exit 1
}
command -v xsel >/dev/null 2>&1 || {
   echo >&2 "'xsel' required but not installed.  Aborting."
   exit 1
}

SCRIPTPATH=$(realpath "$(dirname "$0")")

MENU=(home)
d_home=("$HOME/Documents/Repositories/Wallpapers")
FD_OPTIONS=(-t f)

if [[ ${#MENU[@]} -gt 1 ]]; then
   res=$(printf "%s\n" "${MENU[@]}" | rofi -dmenu)
else
   res="${MENU[0]}"
fi

# Build all thumbnails
coproc (bash "$SCRIPTPATH/build_thumbnails.sh" "${d_home[@]}")

with_thumbnail() {
   without_prefix=${1#"$HOME/Documents/Repositories/Wallpapers/"}
   printf "$without_prefix\x0icon\x1f$1\n"
}
export -f with_thumbnail

# declare dirs as being an indirection upon d_$res
declare -n dirs="d_$res"
declare -n files="f_$res"
declare -n options="o_$res"

{
   if [[ -n "${files[*]}" ]]; then
      printf -- '%s\n' "${files[@]}"
   fi
   if [[ -n $dirs ]]; then
      {
         rg $d_home --no-messages --files 2> /dev/null
      } | sort | xargs -I{} bash -c 'with_thumbnail "$@"' _ {}
   fi
} |
   {
      rofi -theme /home/heikmike/.config/hypr/launchers/configurations/rofi_wallpapers.rasi -dmenu -i
   } | sed -E 's,^.*$,'"$d_home"'/\0,' | xargs -0 -I{} echo "preload={}wallpaper=,{}" > ~/.config/hypr/hyprpaper.conf && hyprpaper
