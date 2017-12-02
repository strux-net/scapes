# acmd
	usage : acmd <file>
	offer a menu of choices of what to do with <file>

	Reads
	  ~/acmd.rc
	  ~/strux/etc/acmd.rc
	  /etc/acmd.rc

	All found files are read (in the order given above) to build the database.
	The commands are valid in the order found.
	OPTIONS:
	  -V	Verbose
	  -a:<file>	Use only this acmd-file
		no default for <file>
	  -l:<file>	Use this acmd-file as a last resort
		no default for <file>
	  -f:<file>	Use this acmd-file as a first resort
		no default for <file>
	  -version	show version information
