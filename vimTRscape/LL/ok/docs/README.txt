LL.vim
  A vim/perl based filebrowser with nice features
    usage
	commands
		LL	start LL for current or given dir/file
		L	convert current buffer to LL
		LLF	LL for files returned be find
		LLG	LL for files containing a given regexp
		LLO	LL for files returned by a shellcmd
		LLasIf	reapply auto-dirsetting according to a given pattern. The default pattern is used if no pattern is given.
	n-mappings for buffer /strux/LL
	notes for new filename
	     Prompts for a new name for the file or dir under the cursor.
	     The usual filename-completion works on the input-line.
	     The new file name is preset with the current-name for easy editing.
	     Type ctrl-u to clear the line and type a completely new path/name

	     A check is performed whether the new file already exists.
	       In this case you are asked for confirmation.
	       Reply with y or Y if you really want the action.
	     Cancel the action with Escape or Ctrl-C
	<2-leftmouse>	Edit the file
	  Double-click is the same as <CR>
	<CR>	Edit the file
	  Edit the file under the cursor in the same vim.
	  Come back to the directory-view with :LL
	  If the cursor is on the header-line toggle it between normal/descriptive
	  Also see |g:strux_LL_editcmd|.
	fr	Rename the file under the cursor
	  Renaming is tried in two steps.
	    First it is tried with the build-in rename().
	    If this fails (e.G if the rename is cross-device), a call to mv is issued.
	fc	Copy the file under the cursor
	  A check is performed whether the source is a directory
	    In this case you are asked for confirmation to recurse.
	    Reply with y or Y if you really want a recursive copy
	fd	Delete the file under the cursor
	  prompts for confirmation
	    Reply with y or Y if you really want the action.
	  Checks whether the file is a directory and whether it is not empty
	    In this case you are again asked for confirmation.
	    Reply with y or Y if you really want a recursive delete
	  Cancel the action with Escape or Ctrl-C
	f+	Put the filename into the clipboard
	f*	Put the filename into primary
	f"	Put the filename into vim's unnamed register (")
	fp+	Put the filename with path into the clipboard
	fp*	Put the filename with path into primary
	fp"	Put the filename with path into vim's unnamed register (")
	notes for shell command
	  At the prompt enter a shell-command.
	  the full-filename is appended to the command (as "$f") if the command does not already contain $
	  The command is NOT subject to vim's treating of some chars as % and #

	  See |g:strux_LL_shell| and |g:strux_LL_shell_setup| for configuring how the command is started.

	  The following vars are set for the command:
	      $f	filename with path		/path/to/file/name.ext
	      $p	path				/path/to/file
	      $F	filename as given		name.ext
	      $r	filename without extension	name
	      $e	extension			ext
	  Cancel the action with Escape or Ctrl-C
	dv	View
	  View the file according to the mailcap file
	de	Edit
	  Edit the file according to the mailcap file
	dc	Compose
	  Compose (create) the file according to the mailcap file
	dp	Print
	  Print the file according to the mailcap file
	d<F4>	Execute a command
	d1<F4>	Execute a command in an xterm
	d2<F4>	Execute a command in an background xterm
	d<S-F4>	Execute a command and read output into a new buffer
	d.	Repeat last command
	  Repeats the last command, this time with the file that is now selected.
	  Whether the output is displayed or ignored is remembered from the last command.
	  An error-message is issued if there is no last command.
	cc	Open the command window
	  Opens the command-vindow (holds the file ~/frequentCommands)
	  The current working directory for the commands executed in this window is what LL just shows.

	  You can invoke it with <count>cc (as in 3cc) to make the window <count> lines high.

	  Special mappings are available in this window.
	    press <F1> in this window to get help on these mappings
	<F4>	Execute this command
	  This command is basically the same as
	    ,cc	open the command window
	    <F4>	execute the command where the cursor is on
	    LL	reenter the LL-window
	1<F4>	Execute this command in an xterm
	  This command is basically the same as
	    ,cc	open the command window
	    1<F4>	execute the command where the cursor is on in an xterm
	    LL	reenter the LL-window
	2<F4>	Execute this command in an background xterm
	  This command is basically the same as
	    ,cc	open the command window
	    2<F4>	execute the command where the cursor is on in an background xterm
	    LL	reenter the LL-window
	<S-F4>	Execute this command.Read Output into a &new buffer
	  This command is basically the same as
	    ,cc	open the command window
	    <S-F4>	execute the command where the cursor is and read output into a new buffer
	    LL	reenter the LL-window
	dd	Execute acmd for current file
	  execute acmd for current file
	d?	Open acmd-menu for current file
	  show all possible acmd commands for current file
	  Special mappings are available in this window.
	    press <F1> in this window to get help on these mappings
	dr	Reread the acmd-database
	  reread the acmd database
	sn	Sort by Name
	  Sort the entries alphabetically by name, obeying case
	  Example :
	    A.c < a.c
	sI	Sort by Name (case ignored)
	  Sort the entries alphabetically by name, ignoring case
	  Example :
	    a.c < B.c
	sN	Sort by Name (numerically)
	  Sort the entries numerically by name
	  Example :
	    2.c  < 10.c
	    a2.c < a10.c
	se	Sort by Extension
	  Sort the entries alphabetically by extension
	  Example :
	    a.c < a.y
	sL	Sort by Length of Basename
	  Sort by the length of the name
	  Example :
	    ab < aaa
	sd	Sort by Dev
	  Sort by device number
	si	Sort by Ino
	  Sort by inode number
	sM	Sort by Mode
	  Sort by mode, numerically
	sl	Sort by Nlink
	  Sort by number of links
	su	Sort by Uid
	  Sort by UID (User id), numerically
	sg	Sort by Gid
	  Sort by GID (Group id), numerically
	sr	Sort by Rdev
	  Sort by Rdev, numerically
	ss	Sort by Size
	  Sort by Filesize
	sa	Sort by Atime
	  Sort by Atime
	sm	Sort by Mtime
	  Sort by Mtime
	sc	Sort by Ctime
	  Sort by Ctime
	sB	Sort by Blksize
	  Sort by Blocksize
	sb	Sort by Blocks
	  Sort by nr. of blocks
	sx	Sort by X-Info
	  Sort by result of xPerFileCommand
	S>	Sort order is descending
	  Sort in descending order.
	S<	Sort order is ascending
	  Sort in ascending order.
	S/	Separate dirs
	  Directories are put at the beginning of the list, regardless of sorting
	S#	Don't Separate dirs
	  Directories and normal files are intermixed, due to sorting
	Sx	Separate tagged
	  Tagged files are put at the beginning of the list, regardless of sorting
	SX	Don't Separate tagged
	  Tagged files and untagged files are intermixed, due to sorting
	Sf	Fix the settings for this dir
	  The current sort-settings are fixed for this directory.
	  The fix can be released by applying a new sort-order in this directory.
	i	Inspect the file
	  Open the inspect window and show a lot of useful information about the file under the cursor.
	  The inspect window has the name /strux/INSPECT and additional commands are available there.
	o	Open the file in a split
	  Edit the file under the cursor in a new window
	p	Preview the file
	  Edit the file under the cursor in the preview window
	xx	Tag the file
	  Tag (mark) the file under the cursor.
	xX	Untag the file
	  Untag (unmark) the file under the cursor.
	xa	Tag all
	  Tag (mark) all files
	xA	Untag all
	  Untag (unmark) all files
	xT	Toggle tags
	  Toggle all tags.
	      Untagged files become tagged, and
	      Tagged files become untagged
	xt	Toggle this
	  Toggle the tag for this file
	xp	Tag by Pattern
	  Prompt for a regexp and tags all files matching this regexp.
	  The regexp has to be a perl-like regexp, not one you know from ls.

	  E.g to tag all c-files that start with the letter a, use:
	  ^a.*\.c$
	xP	Untag by Pattern
	  Prompt for a regexp and untags all files matching this regexp.
	  The same rules as for xp apply here
	xf	Tag by file
	  Prompts for the filename of a namesfile. This file should contain the names of files, each in its own line.
	  Other than xp and xP, these names are not regexpes but literal names.
	  It may be the result of:
	  grep -l something *
	  All files, that occur in the namesfile are tagged.

	  See also :
	      xF
	xF	Untag by file
	  Prompts for the filename of a namesfile. This file should contain the names of files, each in its own line.
	  Other than xp and xP, these names are not regexpes but literal names.
	  It may be the result of:
	  grep -l something *
	  All files, that occur in the namesfile are untagged.

	  See also :
	      xf
	xg	Tag by grep
	  Prompts for grep-cmd and tags all files matched.

	  Example :
	    key *.c *.h
	      tags all your c and h-files that contain the string key
	    -i key *.c *.h
	      make above search case-insensitive

	  Don't be confused by messages like
	  grep: xyz: is a directory.
	  Just press <C-L> to get rid of them.
	  Also see |g:strux_LL_grep|.
	xG	Untag by grep
	  Prompts for grep-cmd and untags all files matched.
	  For details see xg above
	x<F4>	Execute a command to tagged files
	  Prompts for a shell-command and issues this command with the full filename appended. Use # as last character to turn this into a comment
	x1<F4>	Execute a command to tagged files in an xterm
	  Prompts for a shell-command and issues this command with the full filename appended. Use # as last character to turn this into a comment
	x2<F4>	Execute a command to tagged files in an background xterm
	  Prompts for a shell-command and issues this command with the full filename appended. Use # as last character to turn this into a comment
	x<S-F4>	Execute a command to tagged files and read output into a new buffer
	  Prompts for a shell-command and issues this command with the full filename appended. Use # as last character to turn this into a comment
	<BS>	Go to the previously visited dir
	<tab>	Go to the next visited dir
	..	Go to parent dir
	  Enter parent directory of the currently viewed directory
	./	Go to root dir
	  Enter the root-directory /
	.~	Go to home dir
	  Enter the home-directory ($HOME)
	.:	Go to any dir
	  Prompts for a directory and enters this directory
	  filename-completen works here
	ff	Follow the link under the cursor
	  Example : you have the view at dir /usr/bin
	    the file rcp is in fact a link to /etc/alternatives/rcp
	    LL show this as "rcp -> /etc/alternatives/rcp"
	    if you press ff with the cursor on this line the view is changed to /etc/alternatives
	    and the cursor is positioned on rcp
	    here you may see "rcp -> /usr/bin/scp"
	    pressing ff here brings you to /usr/bin with the cursor on the line for scp
	  Same for a file that has a / in its name
	    e.G. if you do "find . whatever | L"
	<C-R>	Refresh the current view
	  Refresh the current view.
	  stat - information are updated and the !-flags are reset
	  The sorting of the listing is repeated.
	  The timestamp in the header-line is adjusted.
	  See also :
	      u
	      U
	u	Update the current view
	  Update the current view.
	  stat - information of files allready in the listing are not updated.
	  Such changes are flagged in the ! - column (see cpg rsp. cpl below)
	  The timestamp of the header-line as well as 
	  the sorting of the listing remains unchanged.
	  Possible flags are:
	      n	file is new since last refresh
	      c	file has changed since last refresh
	      d	file is deleted since last refresh
	      <blank>	file is unmodified since last refresh
	  See also :
	      U
	      <C-R>
	U	Update the current view (keep deleted)
	  Refresh the current view.
	  stat - information are updated and the !-flags are reset
	  THis command works much like <C-R> except that
	  deleted files stay in the listing (marked with d)
	  The sorting of the listing is repeated.
	  The timestamp in the header-line is adjusted.
	  See also :
	      u
	      <C-R>
	.?	View the list of visited dirs
	  Display a list of all visited directories in a separate window.
	  This window has the name /strux/VISITED and additional commands are available there.
	    press <F1> in this window to get help on these mappings
	.!	View the back/forward stack
	  Display the stack used for <BS> and <TAB>
	  This window has the name /strux/DIRSTACK and additional commands are available there.
	    press <F1> in this window to get help on these mappings
	notes for per entry command
	  If the first two characters are "P " then the rest is passed to (build-in) perl.
	    The filename is not automatically appended in this case.
	    The perl-code is executed in the namespace XPE (for x-per-entry).
	  Else the command is executed as a shell command.
	    The complete path to the file is appended (properly quoted) to the command.
	    both stderr and stdout are displayed.
	  The following vars are set for the command:
	      $F	filename (as shown by LL)			file.ext
	      $d	base-directory (as shown in the header-line)	/path/to/
	      $f	filename with path				/path/to/file.ext
	notes for per file command
	  The command is applied to each file if the "Parse String" (see cpg rsp. cpl) contains %x.
	  The command output is put at the position indicated by %x.
	  It is not applied to directories. See cxdl rsp. cxdg for this.
	cxfg	Configure the Global Per File Command
	  It is not applied to directories. See cxdg for this.
	  The local Per File command (as set with cxfl) can override the global Per File command.
	  Example :
	    file -b
	    grep -s something
	    head -q -n 1
	    wc

	    cvs log  -N -rHEAD $F|perl -ne '/date://.../^==/ and print'|perl -ne '$.==2 and print' #
	    cvs status $F 2>/dev/null|perl -ne 'if ($.==2) {s//.*Status: //;print;}' #
	      In the above examples $F is used in the command. LL still appends the full pathname to the command.
	      Therefore the final # is present to turn this into a comment.
	    P open F,$F and do { chomp(my $s=<F>);close F;return $s}
	      the above example is equivalent to "head -q -n 1" but much faster, since no external program needs to be startet.

	  If you set it to empty then the default entry (file -b) will be used.
	  You can set the default entry in your .vimrc with
	    let g:strux_LL_perFileCommand='new command' (see |g:strux_LL_perFileCommand|)
	  See also :
	    cxdg
	    cxfl
	    cxdl
	cxfl	Configure the Local Per File Command
	  It is not applied to directories. See cxdl for this.
	  It overrides a global Per File command (as set with cxfg).
	  Example :
	    cat 2>/dev/null
	      the above exapmple is usefull e.G in /proc/sys or /proc/ide
	    whatis -s1 "$F" | sed -e 's/.*- //' #
	      the above exapmple is usefull e.G in /bin or /usr/bin
	    P open F,$F and do { chomp(my $s=<F>);close F;return $s}
	      the above command is equivalent to "cat 2>/dev/null".

	  If you set it to empty then the gloal entry will be used.
	  See also :
	    cxdg
	    cxfg
	    cxdl
	    dirsettings
	notes for per dir command
	  The command is applied to each directory if the "Parse String" (see cpg rsp. cpl) contains %x.
	  Its output is put at the position indicated by %x.
	  It is not applied to normal files. See cxfl rsp. cxfg for this.
	cxdg	Configure the Global Per Dir Command
	  The local Per Dir command (as set with cxdl) can override the global Per Dir command.
	  Example :
	    du -sh "$F" | awk '{ print $1 }' # 
	    ls -1 "$F"| wc -l #
	      In the above examples $F is used in the command. LL still appends the full pathname to the command.
	      Therefore the final # is present to turn this into a comment.

	    P my $s;opendir DH,$F and do { $s=@{[readdir DH]} ; close DH }; return $s
	      the above example is equivalent to "ls -1 "$F"| wc -l #"  but much faster, since no external program needs to be startet.

	  If you set it to empty then the default entry (# for no command) will be used.
	  You can set the default entry in your .vimrc with
	    let g:strux_LL_perDirCommand='new command' (see |g:strux_LL_perDirCommand|)
	  See also :
	    cxfg
	    cxfl
	    cxdl
	cxdl	Configure the Local Per Dir Command
	  It overrides a global Per Dir command (as set with cxfg).
	  Example :
	    [ -e $F/status  ] && { read pid name status rest < $F/stat;echo -en "$status\t" ; perl -ne 's//.*\t//;chop;print "$_\t";exit' $F/status ; tr '\0' ' ' <$F/cmdline ; } #
	      the above exapmple is usefull e.G in /proc/sys or /proc/ide
	    P return if $F !~ /\d+/  ;my $s;open F,"$F/stat" and do { $s .= (split(/\s+/,<F>))[2]." ";close F };open F,"$F/status" and do { $s .= (split(/\t+|\n/,<F>))[1]."\t";close F };open F,"$F/cmdline" and do { my $x = <F>;$x =~ s/\0/ /g;$s.=$x;close F };$s
	      the above command is equivalent to the shell-command above.

	  If you set it to empty then the gloal entry will be used.
	  See also :
	    cxdg
	    cxfg
	    cxdl
	    dirsettings
	notes for Parse String
	  The format-string defines how to display the dir-entries.
	  It consists of printf style '%' items interspersed with normal text.
	  The formats:
	      %	A single "%" - Character
	      T	A single tab
	      t	denotes tagged lines
	      n	filename
	      /	filename, with "/" appended, if file is a directory, symlinks are indicated by ->
	      i	inode number
	      F	mode flags as octal number
	      f	mode flags in drwxrwxrwx - notation
	      u	user id (numerically)
	      U	user id (text)
	      g	group id (numerically)
	      G	group id (text)
	      s	file size
	      a	atime (in readable form)
	      c	ctime (in readable form)
	      m	mtime (in readable form)
	      d	device number
	      l	number of links
	      r	rdev
	      b	blocksize
	      S	number of blocks
	      A	atime (numerically)
	      C	ctime (numerically)
	      M	mtime (numerically)
	      !	modification flags
	      x	result of per file command, as defined by cxfl or cxfg
	  Any sequence of tabs will be shortened/prolonged to make all tab-seperated columns aligned.
	cpg	Configure the global Parse String
	  Set the parsestring
	  If you enter an empty format-string, it is reset to the default.
	  The format-string defaults to : %t%f %!^I%l^I%U^I%G^I%m^I%s^I%/
	  This can be overwritten by setting |g:strux_LL_parsestring|
	  See also :
	      cpl
	cpl	Configure the local Parse String
	  Set the parse-string for this directory
	  If you enter an empty format-string, it is reset to the global parse string (as set with cpg).
	  See also :
	      cpg
	      dirsettings
	cpr	Reread the LL-autocommands
	  Rereads the file ~/LL.dirsettings which holds the NewView Autocommands
	cpc	Clear the dirsettings for the current dir
	  clears the dirsettings for the displayed directory
	dt	Show technical info for this dir
	  this is intended for debugging reasons
	v-mappings for buffer /strux/LL
	xx	Tag selected files
	  Tag (mark) the selected files
	xX	Untag selected files
	  Untag (unmark) the selected files
	xt	Toggle selected files
	  Toggle the tag for the selected files
	n-mappings for buffer frequentCommands
	<F4>	Execute this command
	  Execute the line under the cursor in your shell
	  The command is executed as typed
	  It is NOT subject to vim's treating of some chars as % and #
	  The following vars are set for the command:
	      $f	filename with path		/path/to/file/name.ext
	      $p	path				/path/to/file
	      $F	filename as given		name.ext
	      $r	filename without extension	name
	      $e	extension			ext
	  See |g:strux_LL_shell| and |g:strux_LL_shell_setup| for configuring this command.
	1<F4>	Execute this command in an xterm
	  same as <F4>, but the command is executed in an xterm.
	  This is usefull if you use gvim (as opposed to (term-)vim), where interactive programs don't work too well.
	  See |g:strux_LL_xterm| for configuring the xterm.
	2<F4>	Execute this command in an background xterm
	  same as <F4>, but the command is executed in an xterm, which again is put into background.
	  You can continune using vim, even if the command is not yet finished.
	  This is usefull if
	      you use gvim (as opposed to (term-)vim), where interactive programs don't work too well.
	      you want to execute a longrunning program in the background (even in (term-)vim)
	  See |g:strux_LL_xterm| for configuring the xterm.
	<S-F4>	Execute this command and read output into a new buffer
	  same as <S-F4>, but the output is read into a new buffer
	1<S-F4>	Execute this command and read output
	  same as <F4>, but the output is read into the frequentCommands buffer.
	  The read output is also visually selected.
	    This is useful to have things like > (shift in) work out of the box
	    Press <ESC> to get rid of the visual selection
	<F3>	LL file under cursor, remain in command-window
	  This command may fail, if the name under the cursor contains spaces
	1<F3>	LL file under cursor
	  This command may fail, if the name under the cursor contains spaces
	2<F3>	LL file under cursor (whole line), remain in command-window
	  Take the whole line as filename, but skip leading whitespaces
	  This is especially useful if the path/filename contains spaces
	  or other strange characters.
	3<F3>	LL file under cursor (whole line)
	  Take the whole line as filename, but skip leading whitespaces
	  This is especially useful if the path/filename contains spaces
	  or other strange characters.
	n-mappings for buffer /strux/INSPECT
	<2-leftmouse>	Inspect harder
	<CR>	Inspect harder
	  On some lines in the inspect-window, you can get more information with this command
	  Notably on the following fields:
	      name		If the file is a symbolic link show the complete link-chain
	      dev		show the disk-free info for the filesystem this file belongs to
	      magic		show more hits of "file", if available
	      process-line	start pst and position the cursor on the appropriate entry
	        see |pstree| for details of this view
	n-mappings for buffer /strux/ACMD
	i	Show the command
	  show the associated command
	<CR>	Do the command
	  execute the selected command
	n-mappings for buffer /strux/DIRSTACK
	<2-leftmouse>	Select the dir
	  Jump to selected dir
	<CR>	Select the dir
	  Jump to selected dir
	s	Show the dir
	  Show to selected dir, but stay in the Dirstack-View
	n-mappings for buffer /strux/VISITED
	<2-leftmouse>	Select the dir
	  Jump to selected dir
	<CR>	Select the dir
	  Jump to selected dir
	s	Show the dir
	  Show to selected dir, but stay in the Visited-View
	dd	Forget this dir
	  The view under the cursor is put into oblivion.
	  It may still be present in the DIRSTACK (for Back (Backspace) and Forward (Tab).
	  If the corresponding view is open right now, it will be remembered until the dir is left.
	v-mappings for buffer /strux/VISITED
	dd	Forget selected views
	  The selected views are put into oblivion.
	  Some of them may still be present in the DIRSTACK (for Back (Backspace) and Forward (Tab)).
	  If one of the corresponding view is open right now, it will be remembered until the dir is left.

	Configuration variables
	  The following vars can be set in your .vimrc or in your environment.
	  Settings in the environment have the highest precedence.

	g:strux_LL_shell : the shell to be used	(defaults to "/bin/sh")
	  (can be superseded with the environment-var $strux_LL_shell)
		  The value of this var is used for:
		      <F4>  and its variants in view frequentCommands.
		      <F4>  and its variants in view LL.
		      d<F4> and its variants in view LL.
		      x<F4> and its variants in view LL.
		      dd and d? and d.       in view LL.
	g:strux_LL_xterm : the xterm to be used	(defaults to "xterm -e")
	  (can be superseded with the environment-var $strux_LL_xterm)
		  The value of this var is used for
		      1<F4>     2<F4>        in frequentCommands.
		      1<F4>     2<F4>        in view LL.
		      d1<F4>    d2<F4>       in view LL.
		      x1<F4>    x2<F4>       in view LL.
		      d.                     in view LL.
	g:strux_LL_shell_setup : setting up shell-commands	(defaults to )
	  (can be superseded with the environment-var $strux_LL_shell_setup)
		  The value of this var is used wherever strux_LL_shell is used.
		  This can be used to tell the shell to do additional initializations.
		  e.G if you specified|g:strux_LL_shell|to be /bin/bash and want it to also
		  obey your aliases, functions and other settings, you can do
		    let g:strux_LL_shell_setup='shopt -s expand_aliases;source ~/.profile'
	g:strux_LL_parsestring : configure how the output of LL looks like.	(defaults to "%t%f %!%T%l%T%U%T%G%T%m%T%s%T%/")
	  (can be superseded with the environment-var $strux_LL_parsestring)
		  The formats:
		      %			A single "%" - Character
		      T			A single tab
		      t			denotes tagged lines
		      n			filename
		      /			filename, with "/" appended, if file is a directory
		      i			inode number
		      F			mode flags as octal number
		      f			mode flags in drwxrwxrwx - notation
		      u			user id (numerically)
		      U			user id (text)
		      g			group id (numerically)
		      G			group id (text)
		      s			file size
		      a			atime (in readable form)
		      c			ctime (in readable form)
		      m			mtime (in readable form)
		      d			device number
		      l			number of links
		      r			rdev
		      b			blocksize
		      S			number of blocks
		      A			atime (numerically)
		      C			ctime (numerically)
		      M			mtime (numerically)
		      !			modification flags
		      x			result of per file command, as defined by cx
		  Note to Windows-Users:
		    %l %U %G give not really useful information on windows-systems
		    you may wish to set it to "%t%f %!%T%m%T%s%T%/"
	g:strux_LL_perFileCommand : per file command	(defaults to "file -b")
	  (can be superseded with the environment-var $strux_LL_perFileCommand)
		  The value of this var is used as the command to be executed for each
		  file (not directory) if parsestring contains %x
	g:strux_LL_perDirCommand : per directory command	(defaults to "#")
	  (can be superseded with the environment-var $strux_LL_perDirCommand)
		  The value of this var is used as the command to be executed for each
		  directory if parsestring contains %x
	g:strux_LL_perFileOrDirText : description for per file/dir command	(defaults to "magic")
	  (can be superseded with the environment-var $strux_LL_perFileOrDirText)
		  The value of this var is used as the string to be output for the
		  descriptive header.
	g:strux_LL_dirsettings : locations for LL.dirsettings	(defaults to "~/LL.dirsettings,~/strux/etc/LL.dirsettings")
	  (can be superseded with the environment-var $strux_LL_dirsettings)
		  The value of this var defines the locations for the dirsettings-file.
		  This is a comma-separeted list of files.
		  All files are read in the given order.
		  For details about this file see |LL-dirsettings|
	g:strux_LL_header : configure the header	(defaults to "%d%T%t%T%n Entries%T%s")
	  (can be superseded with the environment-var $strux_LL_header)
		  The value of this var is used to configure how the header line lookes like
		  The formats:
		      %			A single "%" - Character
		      T			A single tab
		      d			the directory
		      t			the time, where the information was gathered
		      n			the number of entries
		      s			the sorting method
	g:strux_LL_grep : command for xg	(defaults to "grep -l")
	  (can be superseded with the environment-var $strux_LL_grep)
		  The value of this var defines the start of the command for xg.
		  on unix, "grep -l" is a good choice
		  It may be overwritten by the user, but the behaviour of grep is used
		  to determine whether the command succeeded.

		  from the grep manpage (at least on my system)
		    DIAGNOSTICS
		      Normally, exit status is 0 if matches were found, and 1 if
		      no matches were found.  (The -v option inverts  the  sense
		      of  the exit status.)  Exit status is 2 if there were syn
		      tax errors in the pattern, inaccessible input  files,  or
		      other system errors.

		  Note: even if the command may not return 0, some files may get tagged.
		    Eg. if you use xg with "re *" as reply to "Grepcmd : ", in which case
		    all files are searched, but some of them may be directories, which force
		    grep to return something not equal to zero.
	g:strux_LL_editcmd : command for <CR>	(defaults to "edit")
	  (can be superseded with the environment-var $strux_LL_editcmd)
		  The value of this var defines how a file is to be opened when pressing <CR>
		  on a filename or double clicking it.
		  Directories are always entered in the LL-view.
		  The default "edit" means : edit the file in the same window in which the directory is shown.
		  You may wish to set it to one of >
		    split
		    vsplit
		    rightbelow split
		    leftabove split
		    rightbelow vsplit
		    leftabove vsplit

		  < Many users might find the combination with |:only| useful. As in: >
		      only|rightbelow vnew|wincmd p|30wincmd \||wincmd p|edit
		  < Together with a parsestring consisting of only "%/" this gives a nice
		    little hot-dir listing. (See |LL-cpg|)

		    For more information see |:split|,|:vsplit|,|:rightbelow|,|:leftabove| and |:only|
	g:strux_LL_dateFormat : strftime - format for printing dates	(defaults to "%Y-%m-%d %H:%M:%S")
	  (can be superseded with the environment-var $strux_LL_dateFormat)
		  The value of this var defines the format for printing timestamps.
		  See the manual page of the C function strftime() for the format.
		  Some settings to try: >
		    %y-%m-%d %H:%M:%S
		    %d.%m.%y %H:%M:%S
		    %d.%m.%Y %H:%M:%S
		  <
	g:strux_LL_debug : for debugging purposes
	  (can be superseded with the environment-var $strux_LL_debug)
		  The temp-file after executing a command of the <f4>-family is not deleted if this option is set.

