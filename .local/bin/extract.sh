#!/usr/bin/env bash
# function Extract for common file formats
#
# This is a Bash function called "extract" that is designed to extract a variety of file formats.
# It takes one or more arguments, each of which represents a file or path that needs to be extracted.
# If no arguments are provided, the function displays usage instructions.
#
# This bash script allows to download a file from Github storage https://github.com/xvoland/Extract/blob/master/extract.sh
#
# Usage:
#     extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zlib|.cso|.zst>
#
# Example:
# $ extract file_name.zip
#
# Author: Vitalii Tereshchuk, 2013
# Web:    https://dotoca.net
# Github: https://github.com/xvoland/Extract/blob/master/extract.sh


function extract {
    SAVEIFS=$IFS
    IFS=$' \t\n'
    set +e  # abort execution on errors

    if [ $# -eq 0 ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zlib|.cso|.zst>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"

        return 1
    fi

while [[ $# -gt 0 ]]; do
        n="$1"
        shift

        # === STDIN ===
        if [[ "$n" == "-" ]]; then
            if [ -z "$1" ]; then
                echo "Error: must provide extension after '-' (stdin mode)"
                return 1
            fi
            ext="$1"
            shift

            tmpfile=$(mktemp "/tmp/extract.stdin.XXXXXX.$ext")
            cat > "$tmpfile"
            echo "Saved stdin to temp file: $tmpfile"
            extract "$tmpfile"
            rm -f "$tmpfile"
            continue
        fi

        # === FILE CHECK ===
        if [ ! -f "$n" ]; then
            echo "'$n' - file doesn't exist"
            continue
        fi

        case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                tar --auto-compress -xvf "$n" ;;
            *.lzma)      unlzma "$n" ;;
            *.lz4)       lz4 -d "$n" ;;
            *.appimage)  ./"$n" --appimage-extract ;;
            *.tar.lz4)   tar --use-compress-program=lz4 -xvf "$n" ;;
            *.tar.br)    tar --use-compress-program=pbzip2 -xvf "$n" ;;
            *.bz2)       bunzip2 "$n" ;;
            *.cbr|*.rar) unrar x -ad "$n" ;;
            *.gz)        gunzip "$n" ;;
            *.cbz|*.epub|*.zip) unzip "$n" ;;
            *.z)         uncompress "$n" ;;
            *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar|*.vhd)
                7z x "$n" ;;
            *.xz)        unxz "$n" ;;
            *.exe)       cabextract "$n" ;;
            *.cpio)      cpio -id < "$n" ;;
            *.cba|*.ace) unace x "$n" ;;
            *.zpaq)      zpaq x "$n" ;;
            *.arc)       arc e "$n" ;;
            *.cso)       ciso 0 "$n" "$n.iso" && extract "$n.iso" && rm -f "$n" ;;
            *.zlib)      zlib-flate -uncompress < "$n" > "${n%.*zlib}" && rm -f "$n" ;;
            *.dmg)
                mnt_dir=$(mktemp -d)
                hdiutil mount "$n" -mountpoint "$mnt_dir"
                echo "Mounted at: $mnt_dir" ;;
            *.tar.zst)   tar -I zstd -xvf "$n" ;;
            *.zst)       zstd -d "$n" ;;
            *)
                echo "extract: '$n' - unknown archive method"
                continue ;;
        esac
    done

    IFS=$SAVEIFS
}
