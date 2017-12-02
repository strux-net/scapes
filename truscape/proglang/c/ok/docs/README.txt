c_tru
  convert .cTR to .c
    usage
	usage : c_tru [Options] [<file> ....]

	produces a c-file

	find details in
	    ~/strux/doc/c_tru.html
	or if you do not have the strux-tools installed
	    http://www.strux.net/strux_zip/strux/doc/c_tru.html

	per convention the input files have the extension .cTR

	The input
	  consists of one or more input files.
	    If no <file> is given or if <file> is '-' (a dash), then STDIN is used.
	  must obey to the structure as can be seen with --structure.
	The output
	  is written to stdout.
	    you can use '-o filename' to write to filename.
	  is produced when the last line of the last file is seen.

	OPTIONS:
	       -allowP			enables the P (Plan) structure item
			this must be allowed explicitely since this item is potentially insecure
	       -noIntro			Do not generate an intro
	       -noMark			Do not generate marks for Hand written stuff
	       -intro:file		use specified file for intro
			This file will be copied unchanged.
	       -obeyD:string		define what D produces
	       -noAutoSemicolon		Do not autmatically append ; to one-line-statements
	       -noProtos		Do not generate prototypes
	       -noConfigCheck		Do not generate code to include <config.h>
	       -languageType:s[c]	can be c or cpp (not yet completely functional)
	       -use_printf		use printf instead of std::cout for auto print statements (c++)

	       -vhelp shows more options
