findShorterIndent.vim
  find the next/prev line with a shorter indent
    usage
	skips the cursor (in the given direction) according to indents.
	if the cursor is on an empty line
	  skip to the next/prev non-empty
	else
	  if the cursor is on a leftaligned line, i.E the line doesn't start with whitespace 
	    skip to the next/prev leftaligned-line, skipping whole blocks.
	  else
	    skip over all lines with the same or higher indent.

	to install this plugin put this file into ~/.vim/plugin/
	You may sure want to choose other keys for the mappings.

	<Up>	search Up   in normal mode
	<Down>	search Down in normal mode
	<Up>	search Up   in operator-pending mode
	<Down>	search Down in operator-pending mode
	<Up>	search Up   in visual mode
	<Down>	search Down in visual mode

