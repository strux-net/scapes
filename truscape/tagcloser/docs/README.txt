tagcloser_tru
  a simple filter to close html-tags
    usage
	usage : tagcloser_tru [options] [<file> ....]
	reads xml-input and produces xml-output, where
	the unclosed tags are automatically closed, except for
	  tags starting with <!
	  all void html tags
	    <area> <base> <br> <col> <embed> <hr> <img> <input> <link> <menuitem> <meta> <param> <source> <track> <wbr>
	Example:
	  <H1> This tag will be automatically closed
	  <H1> This tag will not be closed, because it already is </H1>
	  <span>
	    This span will be automatically closed
	  <div
	    id="whatever">
	    This div will be automatically closed
	  <span>
	    This span will not be closed
	  </span>
	  <span>
	    Attention : This is wrongly indented. This tag will be automatically closed and end up closed twice.
	    </span>

	two special tags are introduced
	  <jsTR>
	    for jsTR code
	    Example:
	    <jsTR>
	      function square	a
		return a*a
	  <css>
	    for style sheets
	    Example
	      <css>
		h1
		  color	blue
		h2	color	red
	    at-rules are supported (also nested)
	    Example:
	      <css>
		@charset "UTF-8"
		@media print
		  #navigation
		    display	none
		  @media (max-width: 12cm)
		    .note
		      float	none

	the input-file must be properly indented.

	All Options are purely <jsTR>-related.
	For pure html you won't need any of them.

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

	       -vhelp shows more options
