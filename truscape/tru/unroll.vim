" so ~/tru/tru/unroll.vim
set dir=/tmp
map <buffer> <silent> <up>   k:if line(".") < 4\|4\|endif<cr>,prep
map <buffer> <silent> <down> j,prep
map <buffer> ,prep :silent normal p<cr><c-w>p:set syntax=tabify<cr>1gg/^><cr><c-w>p
normal sNGS<,prepp_p
