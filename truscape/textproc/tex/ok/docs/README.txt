tex_tru
  convert .txtTR to tex or pdf
    usage
	usage : tex_tru [Options] [<file> ....]

	produces a tex-file

	find details in
	    ~/strux/doc/tex_tru.html
	or if you do not have the strux-tools installed
	    http://www.strux.net/strux_zip/strux/doc/tex_tru.html

	per convention the input files have the extension .txtTR

	The input
	  consists of one or more input files.
	    If no <file> is given or if <file> is '-' (a dash), then STDIN is used.
	  must obey to the structure as can be seen with --structure.
	The output
	  is written to stdout.
	    you can use '-o filename' to write to filename.
	  is produced when the last line of the last file is seen.

	OPTIONS:
	       -show_vars		show style-vars

	       -vhelp shows more options
