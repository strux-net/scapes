ijoin
  join lines with their (indent-) parents.
    usage
	usage : ijoin [ file ...  ]
	joins lines with their (indent-) parents.
	Each input line gives one output line.

	ijoin -j / for
		a
		  aa
		  ab
		    aba
		  ac
		b
	gives
		a
		a/aa
		a/ab
		a/ab/aba
		a/ac
		b

	OPTIONS:
	       -j:string	joinstring, empty if unspecified

	       -vhelp shows more options
