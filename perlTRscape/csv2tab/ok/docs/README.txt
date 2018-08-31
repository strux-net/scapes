csv2tab
  convert csv for tru
    usage
	usage : csv2tab [Option] [<file> ...]
	csv2tab reads all files given as argument and replaces real field-separators by tab
	the input is supposed to be separated by ;

	only sepaparators outside of quoted strings are treated (single or double-quote)
	unless disabled multiple sequences of TabTab are translated to Tab Tab

	If no file is specified the input is taken from stdin.
	The output is written to stdout
	OPTIONS:
	  -n	do not put spaces between the tabs
	  -d:<delim>	use this delimiter, Good candidate is ,
		default for <delim> is ;
	  -version	show version information
