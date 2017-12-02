session.vim
  maintain vim-sessions
    usage
	maintain vim-sessions.
	the sessions have names.
	If guitablabel is not set, then it will be set so that is shows the tabnumber and the session-name.

	It requires vim with +perl.

	The sessions are saved in the directory ~/vimsessions.

	You can create this directory from within vim with
	  :!mkdir ~/vimsessions

	to install this plugin put this file into ~/.vim/plugin/
	commands
		CreateSessionTab	Create a tab for a particular session
	global n-mappings
	<M-f>S	Save this session
	<M-f>s	Load a new session
	<M-f>r	Reload current session
	<M-f>c	Close this session
	<M-f>C	Close and save this session
	<M-f>z	zoom/unzoom window
	<M-f>Z	zoom window into a new tab
	n-mappings for buffer /strux/sessions
	<CR>	use this session
	  Press enter to use file under cursor
	<C-C>	cancel
	i	enter the name

