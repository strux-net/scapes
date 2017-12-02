ZoomFont.vim
  (un-)zoom fontsize
    usage
	allows to quickly increase/decrease (rsp. switch) fonts.
	You define a font-family like
	  "Courier_New:h<size>:cANSI"	in a windows gui
          "DejaVu Sans Mono <size>"	in a gtk2 gui (the default)
	The <size> is as written (6 characters). It will be replaced with the new size.
	For example a Windows users should have in their .vimrc a line like
	  let g:strux_ZoomFont_family="Courier_New:h<size>:cANSI"
	you can also set some fixed fonts for dedicated sizes like in
	  let g:strux_ZoomFont_9="Century Schoolbook L Italic 9"
	It does only work if a gui is running.

	to install this plugin put this file into ~/.vim/plugin/
	global n-mappings
	<C-kPlus>	increase the font
	<C-kMinus>	decrease the font

	Configuration variables
	  The following vars can be set in your .vimrc or in your environment.
	  Settings in the environment have the highest precedence.

	g:strux_ZoomFont_family : the font-family to be used per default	(defaults to "DejaVu Sans Mono <size>")
	  (can be superseded with the environment-var $strux_ZoomFont_family)
	g:strux_ZoomFont_initialNumber : the starting font size	(defaults to 9)
	  (can be superseded with the environment-var $strux_ZoomFont_initialNumber)
	g:strux_ZoomFont_max : the max font size	(defaults to 24)
	  (can be superseded with the environment-var $strux_ZoomFont_max)

