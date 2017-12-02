isel
  select lines of structured text
    usage
	usage : isel [Options] <regexp> [<file>]
	search for a subtree beginning with a line where the n-th (default first) field matches a given regexp.
	The regexp may be explicitly delimited with / like /regexp/,
	  in this case it may be followed by the usual switches.
	  E.G. useful for /i
	You can not use -w together with anchored strings.

	OPTIONS:
	       -l:number	level where to look, default : any
	       -n:number	stop after n matches, default : show all
	       -f:number[0]	field to match. Counting starts at 0.
	       -nh		no header, i.e the found line itself doesn't output
	       -ni		remove all indent relative to header
	       -w		whole field must match.  Equivalent to ^regexp$
	       -h		print a header for each match
			The form of this header is
			  >>> Line n File f
	       -indicate	show the /-separated tree
	       -tree		show the tree

	       -vhelp shows more options
