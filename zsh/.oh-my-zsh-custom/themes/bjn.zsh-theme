# bjn's oh-my-zsh theme
# By Bart Nagel <bart@tremby.net>
#
# Environment variables:
# ZSH_THEME_HASH_SALT: tinker with some strings until the colours on your
# most-used hosts and users are agreeable.

# Hash a string
hash() {
	if builtin command -v md5 >/dev/null; then
		echo -n "$1" | md5
	elif builtin command -v md5sum >/dev/null; then
		echo -n "$1" | md5sum | cut -b 1-32
	else
		echo "Couldn't find md5 or md5sum binary" >&2
		echo "abc123"
	fi
}

# Choose a colour based on the hash value of a string and print its escape code
#
# Second parameter is true to use background colours as well as foreground,
# otherwise false.
hashcolour() {
	local string="$1"
	local usebackground="$2"

	local hashablecolours
	hashablecolours=(\

		$fg_bold[white] \
		$fg[red] $fg[green] $fg[yellow] $fg[blue] $fg[magenta] $fg[cyan] \
		$fg_bold[red] $fg_bold[green] $fg_bold[yellow] $fg_bold[blue] $fg_bold[magenta] $fg_bold[cyan] \
		)
	if $usebackground; then
		hashablecolours=(\
			$hashablecolours \
			$bg[green]$fg[black] \
			$bg[yellow]$fg[black] \
			$bg[blue]$fg[white] \
			$bg[magenta]$fg[black] \
			$bg[cyan]$fg[black] \
			)
	fi

	local colourcount_hex=$(echo "obase=16; $#hashablecolours" | bc)
	local colourindex=$(echo "ibase=16; $(hash "$ZSH_THEME_HASH_SALT$string" | tr a-f A-F) % $colourcount_hex + 1" | bc)
	echo -n $hashablecolours[$colourindex]
}

# Choose a colour for this combination of user and host to use for prompt
# brackets
local promptcolour=$(hashcolour $(whoami)$SHORT_HOST false)

PROMPT='\
%{$promptcolour%}[%{$reset_color%}\
%{%(!.$bg[red]$fg_bold[white].$(hashcolour $(whoami) true))%}%n%{$reset_color%}\
%{$fg_bold[black]%}@%{$reset_color%}\
%{$(hashcolour $SHORT_HOST true)%}%m%{$reset_color%}\
%{$fg_bold[black]%}:%{$reset_color%}\
%{$fg[green]%}%~%{$reset_color%}\
%{$promptcolour%}]%{$reset_color%}\
%(!.#.\$)\
 '
PROMPT2='%{$promptcolour%}»%{$reset_color%} '
RPS1='\
$(vi_mode_prompt_info) \
%{%(?.$fg[green].$bg[red]$fg_bold[white])%}↵%?%{$reset_color%}\
$(git_prompt_info)\
%{$fg_bold[black]%}·%{$reset_color%}\
%{$fg[cyan]%}%*%{$reset_color%}'

MODE_INDICATOR="%{$fg_bold[white]%}-- NORMAL --%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}·%{$fg_no_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
