QuickView.vim
  quick-view local settings
    usage
	Quick-View vim-commands.

	Replaces current (or all) window(s) with the result of the function QvSettings and vice-versa.
	Your original buffers are not touched at all.
	The layout of your buffers is kept intact.

	Tries to read the optional file QvSettings.vim in 'runtimepath'

	The default QvSettings does:
	    show buffer-local mappings
	    show buffer-local settings
	    show buffer-local variables

	To make changes active in the running vim-session you can at any time do
	  :ru QvSettings.vim

	to install this plugin put this file into ~/.vim/plugin/
	global n-mappings
	<leader>Qv	quick view for vars and options of all windows
	<leader>qv	quick view for vars and options of current winow

