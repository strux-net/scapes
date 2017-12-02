tabify
  tabalign text
    usage
	usage : tabify [Options] [<file> ...]

	tabify reads all files given as argument and aligns the tabs.
	If no file is specified the input is taken from stdin.
	The output
	  is written to stdout
	  is produced when the last line is seen.

	OPTIONS:
	  -t	textmode (only DOS) : output lines end with \\r
	  -l	treat field after leading tab as second field
	  -m:<maxsize>	max size for the fields
	  -delim:<delimiter>	split on this
		default for <delimiter> is \t+
	  -c:<columns>	columns to tabify, default all
	  -version	show version information
