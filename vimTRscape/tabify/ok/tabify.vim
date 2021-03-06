"
" Autogenerated from vim_tru using tabify.vimTR
" do not edit this file, look for tabify.vimTR and change this
" or you may loose all your changes and probably choose the wrong method.
" goto http://www.strux.net to find more information.
"
" based on tabify.vimTR , version : 4.0
"usage for tabify.vim
"	this plugin provides the v-mapping \ty for tab-aligning a range.
"	To see the effect open this file in vim, go to the testarea at the end.
"	Select a range of lines and hit \ty
"
"	It requires vim with +perl.
"
"	the \ below indicates the leader, you can redefine it (:help leader)
"	To choose a completely different mapping, put the following into your ~/.vimrc
"	    map whatever :<C-U>exe "perl tabify(".line("'<").",".line("'>").")"<CR>
"	  in this case \ty remains untouched, it is not mapped here again.
"
"	to install this plugin put this file into ~/.vim/plugin/
"
"	mappings:
"	\ty	tabify this region
"
"---------------------------------------------
if !(has("perl"))
  finish
endif
if !hasmapto(":<C-U>exe \"perl tabify(\".line(\"'<\").\",\".line(\"'>\").\")\"<CR>",'v')
  " \ty       -> tabify this region
  vmap \ty :<C-U>exe "perl tabify(".line("'<").",".line("'>").")"<CR>
endif
perl <<EOT
#  protos
sub tabify($$);
sub maxsize;

sub tabify($$)
{
  local ($from,$to) = @_;
  #****************************************
  # tabify the lines between from and to (inclusive)
  #****************************************
  # $to = 0 defaults to the last line
  #****************************************
  local @s;                                        # the array of sizes for each column
  local @a;                                        # all columns of a line in an array
  local @b;                                        # array of @a
  (my $success, local $ts) = VIM::Eval("&ts");
  my $count = $curbuf->Count();                    # how many lines are actually available
  if (!($to)) {
    $to = $count;
  }
  for (my $i=$from;$i<=$to and $i <= $count;$i++) {
    $_=$curbuf->Get($i);
    while (s/^(\t*)\t/$1.(' 'x$ts)/e) {
      # convert leading tabs to spaces
    }
    @a=split /\t+/;                                # one ore more tab(s) seperate(s) columns
    push @b,[@a];                                  # this stack is fifo (push/shift)
    maxsize;                                       # of the current columns and the already seen columns
  }
  #****************************************
  # fill array s
  #****************************************
  for (my $i=0;$i<@s;$i++) {
    $s[$i] = $ts*(int ($s[$i]/$ts) + 1);
  }
  for (my $i=$from;$i<=$to;$i++) {
    $a=shift @b;                                   # For each entry ...
    my $tl="";                                     # ... here we construct our result
    for (my $j=0;$j<@$a;$j++) {
      # ... for each column ...
      $tl.="@$a[$j]"."\t"x (($j<$#$a)*(($s[$j]-length(@$a[$j])-1)/$ts+1));
    }
    $curbuf->Set($i,$tl);                          # replace the line in the vimbuf with tl
  }
}

sub maxsize
{
  for (my $i=0;$i<@a;$i++) {
    # For each column ...
    my $l=length $a[$i];                           # ... take the length
    $s[$i] = $l if $l>$s[$i];                      # ... and use it if larger than any entry before
  }
}
EOT
"****************************************
" testarea
"****************************************
"        1	eins	one
"        22	zwei	two
"        333	drei	three
"        4444	vier
"        55555	fuenf
"        666666	sechs
"        7777777	sieben	seven
"        88888888	acht	eight
"        999999999	neun
"        0000000000	zehn	10
"        aaaaaaaaaaa	elf	11
"        bbbbbbbbbbbb	zwoelf
"        ccccccccccccc	dreizehn
"        dddddddddddddd	vierzehn
"        eeeeeeeeeeeeeee	fuenfzehn
"        ffffffffffffffff	sechszehn
"        1
"         2
"          3
"           4
"            5
"             6
"              7
"               8
"                9
"                 10
"                  11
"                   12
"                    13
"                     14
"       1		2
"                       3
"****************************************
