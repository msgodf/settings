alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias :q='exit'

alias gittree='git log --graph --pretty=oneline --abbrev-commit'
alias cliplog='xclip -selection CLIPBOARD -o|cut -b1 --complement|xargs git log'
alias clipdiff='xclip -selection CLIPBOARD -o&&echo&xclip -o|xargs git diff'
alias mvna='mvn clean verify -Pacceptance'
alias findjars="find . -name *.jar|tr '\n' :"
alias getallmethodsignatures='git grep -h -E "^\s+\w+(\s+\w+)(\s+\w+)?\s*\(.*\)\s*\{"'

color_maven() {
    local BOLD=`tput bold`
    local UNDERLINE_ON=`tput smul`
    local UNDERLINE_OFF=`tput rmul`
    local TEXT_BLACK=`tput setaf 0`
    local TEXT_RED=`tput setaf 1`
    local TEXT_GREEN=`tput setaf 2`
    local TEXT_YELLOW=`tput setaf 3`
    local TEXT_BLUE=`tput setaf 4`
    local TEXT_MAGENTA=`tput setaf 5`
    local TEXT_CYAN=`tput setaf 6`
    local TEXT_WHITE=`tput setaf 7`
    local BACKGROUND_BLACK=`tput setab 0`
    local BACKGROUND_RED=`tput setab 1`
    local BACKGROUND_GREEN=`tput setab 2`
    local BACKGROUND_YELLOW=`tput setab 3`
    local BACKGROUND_BLUE=`tput setab 4`
    local BACKGROUND_MAGENTA=`tput setab 5`
    local BACKGROUND_CYAN=`tput setab 6`
    local BACKGROUND_WHITE=`tput setab 7`
    local RESET_FORMATTING=`tput sgr0`
    $MAVEN_HOME/bin/mvn  $@ | sed -e "s/\(\[INFO\]\ \-\-\-\ .*\)/${TEXT_BLUE}\1${RESET_FORMATTING}/g" \
        -e "s/\(\[INFO\]\ \[.*\)/${RESET_FORMATTING}\1${RESET_FORMATTING}/g" \
        -e "s/\(\[INFO\]\ \)\(BUILD SUCCESS\)/\1${TEXT_GREEN}\2${RESET_FORMATTING}/g" \
        -e "s/\(\[INFO\]\ \)\(BUILD FAILURE\)/\1${TEXT_RED}\2${RESET_FORMATTING}/g" \
        -e "s/\(\[WARNING\].*\)/${TEXT_YELLOW}\1${RESET_FORMATTING}/g" \
        -e "s/\(\[ERROR\]\)/${TEXT_RED}\1${RESET_FORMATTING}/g" \
        -e "s/\(Exception in thread \".*\" \)\(.*\)/\1${TEXT_RED}\2${RESET_FORMATTING}/g" \
        -e "s/\(SUCCESS \)\[/${RESET_FORMATTING}${TEXT_GREEN}\1${RESET_FORMATTING}\[/g" \
        -e "s/\(FAILURE \)\[/${RESET_FORMATTING}${TEXT_RED}\1${RESET_FORMATTING}\[/g" \
        -e "s/\(Caused by: \)\([^:\t ]*\)/\1${TEXT_RED}\2${RESET_FORMATTING}/g" \
        -e "s/\(ERROR\ \[.*\)/${TEXT_RED}\1${RESET_FORMATTING}/g" \
        -e "s/Tests run: \([^,]*\), Failures: \([^,0]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${TEXT_GREEN}Tests run: \1${RESET_FORMATTING}, Failures: ${TEXT_RED}\2${RESET_FORMATTING}, Errors: ${TEXT_RED}\3${RESET_FORMATTING}, Skipped: ${TEXT_YELLOW}\4${RESET_FORMATTING}/g"

    echo -ne ${RESET_FORMATTING}  
}

MAVEN_HOME=/opt/apache-maven-3.0.3
alias mvn=color_maven
alias maven=$MAVEN_HOME/bin/mvn

bind '"\e[24~"':$'"\201"'
bind -x $'"\201":cd ..&& echo $PWD'

