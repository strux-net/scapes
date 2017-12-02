xterm.vim
  show the other screen
    usage
	this only works when running vim in an xterm.

	Sometimes some vim-commands produce output that will only be seen for very short.
	xterm has a primary screen, to which vim will switch when executing shell-commands.
	You see it if you suspend vim (with ^Z).

	There is a way to display it while staying in vim.

	This plugin provides the function ShowPrimaryScreen.
	A call to this function is mapped to \sp
	the \ above indicates the leader, you can redefine it (:help leader)

	To choose a completely different mapping, put the following into your ~/.vimrc
	    map whatever :call ShowPrimaryScreen()<CR>
	  in this case \sp remains untouched, it is not mapped here again.

	to install this plugin put this file into ~/.vim/plugin/

	<leader>sp	show the primary screen (until keypress)

