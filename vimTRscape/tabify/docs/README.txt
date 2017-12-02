tabify.vim
  tabalign a visual region
    usage
	this plugin provides the v-mapping \ty for tab-aligning a range.
	To see the effect open this file in vim, go to the testarea at the end.
	Select a range of lines and hit \ty

	It requires vim with +perl.

	the \ below indicates the leader, you can redefine it (:help leader)
	To choose a completely different mapping, put the following into your ~/.vimrc
	    map whatever :<C-U>exe "perl tabify(".line("'<").",".line("'>").")"<CR>
	  in this case \ty remains untouched, it is not mapped here again.

	to install this plugin put this file into ~/.vim/plugin/

	mappings:
	\ty	tabify this region

