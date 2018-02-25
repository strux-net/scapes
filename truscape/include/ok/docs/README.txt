include
  
    usage
	usage : include [Options] [<file>]
	search for lines of the form "INCLUDE<tab>filename".
	it is particularly intended for structured text.
	Example:
		foo
		  bar
		bar
		  INCLUDE	file2include
		  INCLUDE	`ls`
	if file has the form `command args` it is treated as a command.
	the file is indented according to the level of the INCLUDE-statement.
	The included file is again subject for further INCLUDE-statements.

	The tag "INCLUDE" can be changed with option -s

	OPTIONS:
	       -s:regexp[^INCLUDE$]	tag (instead of the default INCLUDE)

	       -vhelp shows more options
