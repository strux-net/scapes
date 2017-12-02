ApplyMarks.vim
  apply text-marks
    usage
	Invoke it by typing
	  :ApplyMarks

	This will search the current buffer for all occurences of the string vimmark
	and use the next character as a mark for the line where the string appears.

	e.G
	  // this line contains the string vimmarku and ApplyMarks sets mark u for this line

	to install this plugin put this file into ~/.vim/plugin/
	commands
		ApplyMarks	Apply all found strings of the form vimmarkx as mark x

