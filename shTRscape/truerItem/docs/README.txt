truerItem
  find lines that are matched by a specific item of a specific truer
    usage
	usage : truerItem [Options] <truer> <action> files ....
	Echo all lines of the files for which <truer> would execute <action>.

	Example : truerItem perl_tru fancyFor *.plTR
	  This will parse all *.plTR files and echo the lines which perl_tru considers a fancyFor

	It does not run <truer>.
	Instead a new temp-truer is created from the structure of <truer> where the only defined action is <action>.

	It may fail to recognize the correct structure if weird things with >> or @READ are done in the <truer>.
	OPTIONS:
	  -h	print filename and linenumber before each hit
	        same as -a '$ARGV\t$.\t$_'
	        The result is suitable to be piped through tabify.pl
	  -a:<string>	use specified string as action
		default for <string> is $indent$_
	        Example -a '$.\t$_'
	  -f:<file>	read action-names from file
	        The file should contain action-names (and args, if needed) each on it's own line.
	  -e	make empty actions
	        this is useful if you want to refer to parent-items
	        Example : truerItem -e -a '$goal\t$Title' m_tru goal mTR
	  -v	run vim on the result
	        vim is started with the result as cfile.
	        This allows for fast browsing the result.
	        Do not use together with -h.
	        Noteworthy if you want to also use option -a 
	            put -a after -v
	            let the argument to -a start with $ARGV:$.:
	  -c:<ex-cmd>	set additional vim initialization
		default for <ex-cmd> is set swb=
	        Just a matter of taste.
	        You can use "-c= " for an empty additional initialization 
	  -s	skip comment lines
	        Useful for truers that ignore lines starting with #
	  -version	show version information
