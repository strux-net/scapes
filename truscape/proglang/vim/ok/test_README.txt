usage for testfile
  This file serves no special purpose

  It does nothing particularly use- or harmful
    I promise
  commands
	A	comment for coma
	B	comment for comb
	LL	start LL
	C	comment for comc, next (com D) is whitout comment
	D	
  v-mappings for buffer /buffername/
	d:	Helptext 1
  n-mappings for buffer /buffername/
	notes for commmands
	  this is a general help for all commands
	    with indent and	tab
	    
	    and an empty line
	notes for more for commands
	<2-leftmouse>	Helptext 1
	  documentation for this 2-leftmouse
	<2-rightmouse>	Helptext 2
	d:	Helptext 3
	  documentation for this command
	   with odd indent and an ' to see if it survives
	     and some tabs	tab
	       and more text
	d.	Helptext 4
	  documentation for d.
	  Example :
	    P return if $f !~ /\d+/  ;my $s;open F,"$f/stat" and do { $s .= (split(/\s+/,<F>))[2]." ";close F };open F,"$f/status" and do { $s .= (split(/\t+|\n/,<F>))[1]."\t";close F };open F,"$f/cmdline" and do { my $x = <F>;$x =~ s/\0/ /g;$s.=$x;close F };$s
	      the above command is equivalent to the shell-command above.
	  See also :
	      <C-L>
	      u
  global n-mappings
	i	installs this version
	r	rerun everything
	t	remake
	..	Back one level
  global v-mappings
	i	installs this version

  Configuration variables
    The following vars can be set in your .vimrc or in your environment.
    Settings in the environment have the highest precedence.

	g:strux_LL_colored : use colored output
	  (can be superseded with the environment-var $strux_LL_colored)
	g:strux_LL_shell : the shell for the <f4> commands	(defaults to 'bash -i')
	  (can be superseded with the environment-var $strux_LL_shell)
	  This can be used to tell the shell to do additional initializations.
	  e.G if you specified|g:strux_LL_shell|to be /bin/bash and want it to also
	  obey your aliases, functions and other settings, you can do
	    let g:strux_LL_shell_setup='shopt -s expand_aliases;source ~/.profile'

