#!/bin/bash

#
# Script to install simplistic dotfiles by MagePsycho
#
# @author   Raj KB <magepsycho@gmail.com>
# @website  https://www.magepsycho.com
# @version  1.0.0

# UnComment it if bash is lower than 4.x version
shopt -s extglob

################################################################################
# CORE FUNCTIONS - Do not edit
################################################################################
#
# VARIABLES
#
_bold=$(tput bold)
_underline=$(tput sgr 0 1)
_reset=$(tput sgr0)

_purple=$(tput setaf 171)
_red=$(tput setaf 1)
_green=$(tput setaf 76)
_tan=$(tput setaf 3)
_blue=$(tput setaf 38)

#
# HEADERS & LOGGING
#
function _debug()
{
    if [[ "$DEBUG" = 1 ]]; then
        "$@"
    fi
}

function _header()
{
    printf '\n%s%s==========  %s  ==========%s\n' "$_bold" "$_purple" "$@" "$_reset"
}

function _arrow()
{
    printf '➜ %s\n' "$@"
}

function _success()
{
    printf '%s✔ %s%s\n' "$_green" "$@" "$_reset"
}

function _error() {
    printf '%s✖ %s%s\n' "$_red" "$@" "$_reset"
}

function _warning()
{
    printf '%s➜ %s%s\n' "$_tan" "$@" "$_reset"
}

function _underline()
{
    printf '%s%s%s%s\n' "$_underline" "$_bold" "$@" "$_reset"
}

function _bold()
{
    printf '%s%s%s\n' "$_bold" "$@" "$_reset"
}

function _note()
{
    printf '%s%s%sNote:%s %s%s%s\n' "$_underline" "$_bold" "$_blue" "$_reset" "$_blue" "$@" "$_reset"
}

function _die()
{
    _error "$@"
    exit 1
}

function _safeExit()
{
    exit 0
}

#
# UTILITY HELPER
#
function _seekConfirmation()
{
  printf '\n%s%s%s' "$_bold" "$@" "$_reset"
  read -p " (y/n) " -n 1
  printf '\n'
}

# Test whether the result of an 'ask' is a confirmation
function _isConfirmed()
{
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        return 0
    fi
    return 1
}


function _typeExists()
{
    if type "$1" >/dev/null; then
        return 0
    fi
    return 1
}

function _isOs()
{
    if [[ "${OSTYPE}" == $1* ]]; then
      return 0
    fi
    return 1
}

function _checkRootUser()
{
    #if [ "$(id -u)" != "0" ]; then
    if [ "$(whoami)" != 'root' ]; then
        echo "You have no permission to run $0 as non-root user. Use sudo"
        exit 1;
    fi

}

function _printPoweredBy()
{
    local mp_ascii
    mp_ascii='
   __  ___              ___               __
  /  |/  /__ ____ ____ / _ \___ __ ______/ /  ___
 / /|_/ / _ `/ _ `/ -_) ___(_-</ // / __/ _ \/ _ \
/_/  /_/\_,_/\_, /\__/_/  /___/\_, /\__/_//_/\___/
            /___/             /___/
'
    cat <<EOF
${_green}
Powered By:
$mp_ascii

 >> Store: ${_reset}${_underline}${_blue}https://www.magepsycho.com${_reset}${_reset}${_green}
 >> Blog:  ${_reset}${_underline}${_blue}https://blog.magepsycho.com${_reset}${_reset}${_green}

################################################################
${_reset}
EOF
}

################################################################################
# SCRIPT FUNCTIONS
################################################################################
function _printVersion()
{
    echo "Version $VERSION"
}

function _printUsage()
{
    echo -n "$(basename "$0") [OPTION]...

Install simplistic dotfiles provided by MagePsycho.
Version $VERSION

    Options:
	-in,	--install          Fresh Installation
        -sn,    --sync             Sync code from repository
        -dr,    --dry-run          Destination directory (to where the backup file will be moved)
        -h,     --help             Display this help and exit
        -d,     --debug            Display this help and exit
        -v,     --version          Output version information and exit

    Examples:
        $(basename "$0") --install [--sync] [--dry-run] [--debug] [--version]  [--help]

"
    _printPoweredBy
    exit 1
}

function checkCmdDependencies()
{
    local _dependencies=(
      wget
      cat
      basename
      mkdir
      cp
      mv
      rm
      chown
      chmod
      date
      find
      awk
      gzip
      gunzip
    )

    for cmd in "${_dependencies[@]}"
    do
        hash "${cmd}" &>/dev/null || _die "'${cmd}' command not found."
    done;
}

function processArgs()
{
    # Parse Arguments
    for arg in "$@"
    do
        case $arg in
			-in|--install)
                MP_INSTALL=1
            ;;
            -sn|--sync)
                MP_SYNC=1
            ;;
            -dr|--dry-run)
                MP_DRY_RUN=1
            ;;
            --debug)
                DEBUG=1
                set -o xtrace
            ;;
            -v|--version)
                _printVersion
            ;;
            -h|--help)
                _printUsage
            ;;
            *)
                #_printUsage
            ;;
        esac
    done

    validateArgs
}

function initDefaultArgs()
{
    MP_DOTFILES_DIR=$(pwd)
    MP_SYMLINK_DIR="$HOME"
}

function validateArgs()
{
    ERROR_COUNT=0

    if [[ -z "$MP_INSTALL" || "$MP_INSTALL" -ne 1 ]]; then
        ERROR_COUNT=$((ERROR_COUNT + 1))
    fi

    #echo "$ERROR_COUNT"
    [[ "$ERROR_COUNT" -gt 0 ]] && exit 1
}

function reloadBash()
{
    source "$HOME/.bashrc"
}

function linkDotfile()
{
    dest="${MP_SYMLINK_DIR}/${1}"
    dateStr=$(date +%Y-%m-%d-%H%M)

    if [[ -L "${dest}" ]]; then
        # Existing symlink
        _arrow "Removing existing symlink: ${dest}"
        rm ${dest}
    elif [[ -f "${dest}" ]]; then
        # Existing file
        _arrow "Backing up existing file: ${dest}"
        mv ${dest}{,.${dateStr}}
    elif [[ -d "${dest}" ]]; then
        # Existing dir
        _arrow "Backing up existing dir: ${dest}"
        mv ${dest}{,.${dateStr}}
    fi

    # Check if folder exists
    if [[ ! -d $(dirname "${dest}") ]]; then
        _arrow "Creating dir $(dirname ${dest})"
        mkdir -p $(dirname "${dest}")
    fi
    _arrow "Creating new symlink: ${dest}"
    ln -svf "${MP_DOTFILES_DIR}/${1}" "${dest}"
}

function symlinkDotfiles() 
{
    declare -a symlinkPath=('.bash_profile' '.bashrc' '.bash_prompt' '.exports' '.aliases' '.gitconfig' '.gitignore' '.gitignore_global');
    _arrow "Symlinking in dir $MP_SYMLINK_DIR"
    for i in "${!symlinkPath[@]}" ; do
        file="${symlinkPath[$i]}"
        linkDotfile "$file"
    done
}

function printSuccessMessage()
{
    _success "Simplistic Dotfiles by MagePsycho successfully installed!"

    echo "################################################################"
    echo ""
    echo " >> Dotfiles Source         : ${MP_DOTFILES_DIR}"
    echo " >> Dotfiles Destination    : ${MP_SYMLINK_DIR}"
    echo ""
    echo "################################################################"
    _printPoweredBy
}

################################################################################
# Main
################################################################################
export LC_CTYPE=C
export LANG=C

DEBUG=0
_debug set -x
VERSION="1.0.0"

MP_INSTALL=0
MP_SYNC=0
MP_DRY_RUN=0

function main()
{
    #_checkRootUser
    checkCmdDependencies

    [[ $# -lt 1 ]] && _printUsage

    initDefaultArgs
    processArgs "$@"

    symlinkDotfiles

    printSuccessMessage

    exit 0
}

main "$@"

_debug set +x
