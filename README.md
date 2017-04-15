Custom things for `oh-my-zsh`
=============================

These are my custom things for [`oh-my-zsh`][omz].

[omz]: https://github.com/robbyrussell/oh-my-zsh

`themes/bjn.zsh-theme`
----------------------

My zsh theme.

![Screenshot](http://i.imgur.com/N7gGsbw.png)

- Different colours for each user@host combination:
  - Username's colour is chosen via a hash of the username, except super users
    which are always bold white on red
  - Host's colour is chosen via a hash of the hostname
  - Brackets' colour is chosen via a hash of the username and hostname (same
    colour used for continuation prompt)
- Customizable hash salt via the environment variable `ZSH_THEME_HASH_SALT`, so
  if colours of your most-used hosts and users aren't to your liking they can be
  tweaked (set this before sourcing `oh-my-zsh.sh`)
- Vi normal mode indicator on the right
- Exit code always shown on the right, bright when non-zero
- Git status on the right (by means of the [gitfast][gitfast] plugin I'm using
  [git's own git-prompt.sh][git-prompt], which supports various customizations
  via environment variables)
- Time on the right

[gitfast]: https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/gitfast
[git-prompt]: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
