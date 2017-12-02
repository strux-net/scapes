java_tru
  convert .javaTR to .java
    usage
	usage : java_tru [Options] [<file> ....]

	produces a java-file

	find details in
	    ~/strux/doc/java_tru.html
	or if you do not have the strux-tools installed
	    http://www.strux.net/strux_zip/strux/doc/java_tru.html

	per convention the input files have the extension .javaTR

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
	       -GenerateDebugInfo	produce code for debugging the program
			This produces code at the start of each method which tells the methodname and the args to stderr

			You must enable this when running the program with -Dtru_deb=1
			In addition to tru_deb, enable the output of the arguments with -Dtru_deb_args=1
			Also, tru_deb_fullstack=1 can be given to show the fullstack for each method-call
			  these lines are prefixed with * for a normal method and ! for a native method

	       -vhelp shows more options
