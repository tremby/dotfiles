# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bjn"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(urltools gitfast vi-mode colored-man-pages)

# User configuration

# Aliases
#alias man='LC_ALL=C LANG=C man'
alias l='ls -Al'
alias ll='ls -l'
alias ls.='ls -d .*'
alias l.='ls -Ald .*'
alias ls='ls --color=auto'
alias offlineimap-tty='offlineimap -u TTY.TTYUI'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias :q='exit'
alias gist='gist -c'
alias info='info --vi-keys'
alias ssh='TERM=xterm-256color ssh'
alias steam='GDK_SCALE=1 steam'
alias mutt=neomutt

# Path head
local uname=$(uname)
export PATH="$HOME/bin:$HOME/.composer/vendor/bin"
export MANPATH="/usr/local/man:$MANPATH"

# For Mac OS, use GNU coreutils
if [ "$uname" = "Darwin" ] && [ -d /usr/local/opt/coreutils ]; then
	export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
	export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# For Mac OS, add Python path
if [ "$uname" = "Darwin" ] && [ -d $HOME/Library/Python/3.7/bin ]; then
	export PATH="$PATH:$HOME/Library/Python/3.7/bin"
fi

# Path tail
export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/snap/bin"

# Set LS_COLORS (this is the output of dircolors -b)
# On Mac this seems to have to come before sourcing oh-my-zsh
if [ "$uname" = "Darwin" ]; then
	export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
else
	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
fi

# bjn theme config
export ZSH_THEME_HASH_SALT=2

source $ZSH/oh-my-zsh.sh

# Oh-my-zsh has switched on autocd. I don't like that.
unsetopt autocd

# Overrides

# I do not want to run a command in shell A and then have it suddenly listed as
# the last command run in shell B
unsetopt share_history

export PAGER=less
export EDITOR=vim
export MUTT_EDITOR=$EDITOR
export BROWSER=x-www-browser:www-browser

# Git prompt config
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_SHOWCOLORHINTS=true

# Reduce timeout on esc key from 0.4 to 0.1 seconds
export KEYTIMEOUT=1

# More Mac-specific bits
if [ "$uname" = "Darwin" ]; then
	# Avoid GUI for entering private key passphrases on OS X
	export SSH_AUTH_SOCK=

	# React Native Android
	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$PATH:$ANDROID_HOME/emulator
	export PATH=$PATH:$ANDROID_HOME/tools
	export PATH=$PATH:$ANDROID_HOME/tools/bin
	export PATH=$PATH:$ANDROID_HOME/platform-tools

	# NVM
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Load NVM

	# Override browser
	export BROWSER=open

	# Mysql 5.7
	export PATH=$PATH:/usr/local/opt/mysql@5.7/bin
fi

# Ruby
if [ "$uname" = "Darwin" ]; then
	export PATH="/usr/local/opt/ruby/bin:$PATH"
else
	export PATH="$HOME/.rbenv/bin:$PATH"
fi
eval "$(rbenv init -)"

# Heroku toolbelt
if [ -d /usr/local/heroku/bin ]; then
	export PATH="$PATH:/usr/local/heroku/bin"
fi

# Arduino SDK
if [ -d /opt/arduino ]; then
	export ARDUINO_PATH=/opt/arduino
fi

# For GPG/vim
export GPG_TTY=$(tty)

# MPD host
if [ $(hostname) = spiral -o $(hostname) = elastic ]; then
	export MPD_HOST=hoard
fi

# fzf
FZF_DIR=/usr/local/opt
if [[ ! "$PATH" == *$FZF_DIR/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$FZF_DIR/fzf/bin"
fi
[[ $- == *i* ]] && source "$FZF_DIR/fzf/shell/completion.zsh" 2>/dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
