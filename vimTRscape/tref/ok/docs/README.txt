tref.vim
  provide context view (indent related)
    usage
	this plugin provides the mapping \tr for opening a context-view for the current line.

	It requires vim with +perl.

	a new window is opened which contains only the parent (wrt. to indent) lines of the current line.

	the \ below indicates the leader, you can redefine it (:help leader)
	To choose a completely different mapping, put the following into your ~/.vimrc
	    map whatever :perl loc<CR>:exe "resize ". line("$")<CR>mxgg'x<C-W>p:<BS>
	  in this case \tr remains untouched, it is not mapped here again.

	to install this plugin put this file into ~/.vim/plugin/
	you also need to have LL installed, since this provides disp.vim, which is also required here.
	n-mappings for buffer /strux/Context
	<CR>	go to the line
	  go to this line
	\tr	open context for the current line

