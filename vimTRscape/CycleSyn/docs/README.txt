CycleSyn.vim
  cycle through syntax-settings
    usage
	cycle through different syntax-highlighting settings.

	press \cs to cycle
	or press 4\cs to jump directly to setting 4

	the \ above indicates the leader, you can redefine it (:help leader)

	To choose a completely different mapping, put the following into your ~/.vimrc
	    nmap whatever :<c-u>call CycleSyn()<CR>
	  in this case \cs remains untouched, it is not mapped here again.

	the settings are
	  1	syn off
	  2	syn white
	  3	syn showIndent		currently only in gui
	  4	syn tabify
	  5	syn &ft			the usual highlighting

	To see the effect of the settings it's best to open the corresponding syntax file in a buffer
	and cycle to the setting.

	e.G to see what tabify means do
	  :sp ~/.vim/syntax/tabify.vim
	  and then type
	    4\cs

	to install this plugin put this file into ~/.vim/plugin/
	You must also have the following 3 fines in ~/.vim/syntax/
	  white.vim
	  tabify.vim
	  showIndent.vim
	<leader>cs	Cycle through off white indent tabify filetype

