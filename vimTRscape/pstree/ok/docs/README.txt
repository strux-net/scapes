pstree.vim
  inspect the process-tree
    usage
	investigate the pstree.
	some of the commands only work on debian-based systems.

	start it by editing /strux/pstree

	Note that this file (/strux/pstree) is not supposed to really exist.

	You can also (in your shell) try
	  pst
	or
	  pst vim

	to install this plugin put this file into ~/.vim/plugin/
	n-mappings for buffer /strux/pstree
	r	Refresh view
	  refreshes the view reflecting the changes in the pstree
	P	Goto next pid
	  move cursor to the next Pid
	p	Search next Pid and show info
	  move cursor to the next Pid and show info for this pid
	K	Kill this process
	  prompts for a kill-command,
	  the PID under or right of the cursor is inserted.
	  the cursor is right of the signal
	  You may wish to adjust the signal before pressing <ENTER>
	i	Info about this pid
	  shows info for the pid under the cursor.
	  If there is no pid under the cursor, the next pid in this line right of the cursor is tryed
	  If there is no pid right of the cursor, the pid left of the cursor is used
	a	LL of /proc/<pid>
	  for the pid under the cursor start LL in /proc/<pid>


