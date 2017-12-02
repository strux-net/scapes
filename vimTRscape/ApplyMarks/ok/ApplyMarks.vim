"
" Autogenerated from vim_tru using ApplyMarks.vimTR
" do not edit this file, look for ApplyMarks.vimTR and change this
" or you may loose all your changes and probably choose the wrong method.
" goto http://www.strux.net to find more information.
"
" based on ApplyMarks.vimTR , version : 3.0
"usage for ApplyMarks.vim
"	Invoke it by typing
"	  :ApplyMarks
"
"	This will search the current buffer for all occurences of the string vimmark
"	and use the next character as a mark for the line where the string appears.
"
"	e.G
"	  // this line contains the string vimmarku and ApplyMarks sets mark u for this line
"
"	to install this plugin put this file into ~/.vim/plugin/
"	commands
"		ApplyMarks	Apply all found strings of the form vimmarkx as mark x
"
"---------------------------------------------
"Apply all found strings of the form vimmarkx as mark x
com ApplyMarks call ApplyMarks()
function!ApplyMarks() 
  let hitcount=0
  let save_cursor = getcurpos()
  let marks={}
  1
  echohl WarningMsg
  while search("vimmark","eW") > 0
    let c = getline(".")[col(".")]
    exe "ma "c
    if has_key(marks,c)
      echom "mark" c "set mulitple times"
    endif
    let marks[c]=1
    let hitcount=hitcount+1
  endwhile
  echohl None
  call setpos('.', save_cursor)
  echo "found" hitcount "marks"
endfunc
