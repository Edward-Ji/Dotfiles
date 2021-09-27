# Supress the lengthy message but indicate it's bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# Pre-process prompt
export PROMPT_COMMAND=precmd

precmd() {
    # Get exit code
    local exit_code="$?"

    # Working directory truncated to last three
    local wd=$(echo ${PWD/${HOME}/'~'} | rev | cut -d / -f 1-3 | rev)

    # Font styles
    local bold="\[$(tput bold)\]"
    local normal="\[$(tput sgr0)\]"
    # Font colors
    local red='\[\e[0;31m\]'
    local green='\[\e[0;32m\]'
    local default='\[\e[0m\]'

    PS1="${bold}${wd}${normal} "

    if [[ ${exit_code} != 0 ]]
    then
        PS1+="${red}\$${normal} "
    else
        PS1+="${green}\$${normal} "
    fi
}
