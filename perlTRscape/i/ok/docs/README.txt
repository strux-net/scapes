i
  indents or outdents a file by a given amount.
    usage
	usage : i [<Option>] [<file>]
	indents or outdents a file by a given amount.
	tabs are assumed to count for 8 spaces.

	care is taken not to simply prepend spaces to lines that start with a tab.

	reads stdin if no file is given.

	only one option can be given.
	without any option it defaults to -i 2

	OPTIONS:
	  -i:<number>	indent in  (by space)
	  -o:<number>	indent out (by space)
	  -it:<number>	indent in  (by tab)
	  -version	show version information
