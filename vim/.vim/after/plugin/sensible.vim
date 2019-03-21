" Add italic to whatever the comment highlight style is
redir => s:comment
silent highlight Comment
exe "highlight Comment cterm=italic " join(split(s:comment)[2:], " ")
redir END
unlet s:comment
