. ~/bin/bash_colors.sh

# Add paths that should have been there by default
export PATH=/usr/local/bin:/Applications/MAMP/bin/php/php5.3.6/bin:/Applications/MAMP/Library/bin:$PATH
export PATH="$HOME/bin:$PATH"
#export PATH="$PATH:~/.gem/ruby/1.8/bin"

export PATH=/usr/local/git/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


umask 0002

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# ACTUAL CUSTOMIZATION OH NOES!
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}
grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi
        local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "$NORMAL($CYAN%s$NORMAL|$SINCE_LAST_COMMIT)"`
        echo ${GIT_PROMPT}
    fi
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u:\W $(parse_git_branch)\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
${BRIGHT_GREEN}\u@\h${NORMAL}:${BLUE}\w${RED}\$(grb_git_prompt) $ ${NORMAL}\n"
PS2='> '
PS4='+ '
}
proml

gd() { git diff $* | view -; }
gdc() { gd --cached $*; }

alias pygrep="grep --include='*.py' $*"
alias rbgrep="grep --include='*.rb' $*"
alias jsgrep="grep --include='*.js' $*"
alias ls='ls -G'
alias ll='ls -lG'
alias l='ls -hal'
alias c='clear'
alias vim='mvim -v'
alias vi='mvim -v'
alias mango="pushd /Users/rlevin/programming/sugar/Mango; clear;"
alias sidecar="pushd /Users/rlevin/programming/sugar/Mango; clear;"
alias htdocs="pushd /Applications/MAMP/htdocs; clear;"
alias xdebug="pushd /Applications/MAMP/bin/php/php5.3.6/lib/php/extensions/no-debug-non-zts-20090626; clear;"
alias rails="/Users/rlevin/.rvm/gems/ruby-1.9.3-p125/bin/rails"

activate_virtualenv() {
    if [ -f env/bin/activate ]; then . env/bin/activate;
    elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
    elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
    elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
    fi
}

python_module_dir () {
    echo "$(python -c "import os.path as _, ${1}; \
        print _.dirname(_.realpath(${1}.__file__[:-1]))"
        )"
}

source ~/bin/git-completion.bash

alias phantomjs='/Users/rlevin/bin/phantomjs-1.5.0/bin/phantomjs'
alias gitx="/Applications/GitX.app/Contents/MacOS/GitX"
alias stree="/Applications/SourceTree.app/Contents/MacOS/SourceTree"


set -o vi
