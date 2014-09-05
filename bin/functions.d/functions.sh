#!/bin/bash
##################################################################
#  This file defines useful functions
#  Michael Pratt <pratt@hablarmierda.net>
##################################################################
# Creates symlinks - Used in Installation files
function symlinkIt()
{
    local src=$(realpath "${1}")
    local dst=${2}

    if [ -e "${dst}" ]; then
        echo "Removing ${dst}"
        rm -rf ${dst}
    fi

    if [ -e "${src}" ]; then
        echo "Linking $(basename ${src})"
        ln -sf ${src} ${dst} || echo "Error Linking ${dst}"
    else
        echo "Could not find ${src}"
    fi
}

# Copies a directory/file - Used in Installation files
function copyIt()
{
    local src=$(realpath "${1}")
    local dst=${2}

    if [ -e "${src}" ]; then
        echo "Copying $(basename ${src})"
        if [ -f "${src}" ]; then
            local dstsum=$(md5sum "${dst}" | cut -d ' ' -f1)
            local srcsum=$(md5sum "${src}" | cut -d ' ' -f1)

            if [[ "${dstsum}" == "${srcsum}" ]]; then
                rm -rf ${dst}
            else
                read -p "Files dont match. Do you want to remove ${dst} before copying? (y/n/diff) " RM
                if [[ "${RM}" == "diff" ]]; then
                    diff -u ${src} ${dst}
                    copyIt ${src} ${dst}
                    return 0
                fi

                if [[ "${RM}" == "y" ]]; then
                    rm -rf ${dst}
                fi
            fi
            cp -r ${src} ${dst}
        elif [ -d "${src}" ]; then
            rsync --exclude .git -artvq ${src}/ ${dst}/
        fi

    else
        echo "Could not find ${src}"
    fi
}

# Go to a directory or file's parent. Move/Copy and follow
function goto() { [[ -d "$1" ]] && cd "$1" || cd "$(dirname $1)"; }
function cpf() { cp "$@" && goto "$_"; }
function mvf() { mv "$@" && goto "$_"; }
function mkcd() { mkdir -p "$1" && goto "$1";}

# Create a password
function makepass()
{
    local len=32;
    if [ "${#}" -eq 1 ]; then
       len=${1}
    fi

    local pass=$(openssl rand -base64 ${len} | tr -d '=' | tr '/' '_' | tr '+' '.')
    echo ${pass:0:${len}}
}

# Math
function hex2dec() { printf "%d\n" 0x${1}; }
function dec2hex() { printf "%X\n" ${1}; }
function bin2dec() { echo "ibase=2; obase=A; $*" | bc; }
function dec2bin() { echo "obase=2; $*" | bc; }
function calculate() { echo "scale=2; $@" | sed 's/*/\*/' | bc -l; }

# Date functions
function stamp2date() { awk -v date=$1 'BEGIN { print strftime("(d/m/y h:m:s): %d/%m/%Y - %H:%M:%S", date)}'; }
function date2stamp() { [ -z "$*" ] && echo "date2stamp Y-M-D h:m:s [2009-02-03 15:58:00]" && return 1; date --date="$*" +%s; }

# Make gvim open files in the same instance
function gvim() { command gvim --remote-tab-silent $@ || command gvim $@; }

# Search for sinonyms
function sinonimo()
{
    local baseUrl="http://www.wordreference.com/sinonimos"
    local word=$(echo ${1} | tr ' ' '+')
    exo-open "${baseUrl}/${word}"
}
