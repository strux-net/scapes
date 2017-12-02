ftrace
  trace a process (and it's childs) and produces a tree-view summary.
    usage
	usage : ftrace [options] [ -- strace-options ] [ command [ args ] ]

	trace a process (and it's childs) and produces a tree-view summary.

	Example :
	  ftrace -p 33445
	  ftrace apt-get install whatever

	If the command contains options you need to stop the option-parsing of ftrace
	  ftrace -- rsync -a /this /there

	For -p to work you need
	  either
	    echo 0 > /proc/sys/kernel/yama/ptrace_scope
	  or
	    vi /etc/sysctl.d/10-ptrace.conf
	Notes : 
	  ftrace does not trace suid-programs (unless you are root).
	    Even a (at first glance) harmless ping is such a candidate.
	    consider this when tracing scripts.
	  when attaching to a running process (with -p) there is a small time-window, where ftrace may get confused.
	    ftrace has to figure out what the current cwd of the process to be attached is.
	    then ftrace attaches to this process.
	    If between these two steps the cwd of the process changes, then some (or all) paths may be wrong.
	  You will most likely never need to set strace-options.
	    ftrace will provide the needed options automatically
	  It can also parse exiting trace-files
	    the trace file should be produced with
	      strace -q -f -ttt -o strace.out -- yourCommandHere
	    run ftrace
	      ftrace -f strace.out 
	  The strux-tools contain a syntax-file for viewing the tree with vim.
	    in a vim-buffer with the output of ftrace do
	      :set ft=ftrace
	Bugs : 
	  Probably some
	OPTIONS:
	  -p:<pid>	a pid to trace
	  -fno	file names only
	  -q	quiet (don't print header)
	  -s	give information about bytes written to stdout and stderr
	  -v	verbose (tell the flags used for file actions)
	  -i:<regexp>	do not report files matching the given regexp
		default for <regexp> is /dev/
	  -f:<file>	do not trace anything but parse an existing strace-file
	  -fd:<dir>	for -f tell in what dir the trace was created
		default for <dir> is /unknown/
	  -oa:<file>	append output to the given file
	  -o:<file>	write output to the given file
	  -Pp	preprend the pid in the output
	  -version	show version information
