#!/usr/bin/perl
#
# Autogenerated from perl_tru using trusupp.plTR
# do not edit this file, look for trusupp.plTR and change this
# or you may loose all your changes and probably choose the wrong method.
# goto http://www.strux.net to find more information.
#
#  protos
sub tru::main;
sub tru::subinc(*);
sub tru::prepare_xREAD;
sub tru::setOutputFile;
sub tru::indentval($);
sub tru::doc;
sub tru::source;
sub tru::respecial;
sub tru::structure;
sub tru::actionArgsIn;
sub tru::actionArgsOut;
sub tru::macroin($$$);
sub tru::macro_in_seq;
sub tru::macro_out_seq;
sub tru::inRange;
sub tru::debug;
sub tru::umacro($$);
sub tru::parse;
sub tru::debRev;
sub tru::macro_out_forced($);
sub tru::macro_in_witharg;
sub tru::macroout;
sub tru::getrindent($);
sub debout($);
sub tru::CheckStatesPath($$$**$);
sub tru::csp($$);
sub tru::write_seq;
sub tru::showTruOptions;
sub tru::write_depth;
sub tru::shiftMarks;
sub tru::macro_in_depth;
sub tru::macro_out_depth;
sub setmark($);
sub usemark($);
sub unusemark;
sub clonemark($$);
# based on trusupp.plTR , version : 4.0
#
# trusupp.pl is required by every truer and should be located in ~/strux/lib
#
use Getopt::Long qw(:config no_ignore_case);
# vars
# basic setup
$delim = "\t+";                                    # on what to split
$sdel  = "\x00";                                   # a character that must not be in the infile
$.=0;

sub tru::main
{
  if (!(GetOptions(@Options))) {
    usage();
  }
  if ($opt_version) {
    tru::showVersion();
  }
  if ($opt_doc) {
    tru::doc();
  }
  if ($opt_source or $opt_macros) {
    tru::source();
  }
  if ($opt_structure or $opt_vstructure) {
    tru::structure();
  }
  if ($opt_help or $opt_vhelp) {
    usage();
  }
  if ($opt_ovhelp) {
    tru::showTruOptions() ; exit 1;
  }
  if ($opt_ohelp) {
    tru::showOptions()   ; exit 1;
  }
  if (defined($opt_o)) {
    tru::setOutputFile();
  }
  if (!(@F = @ARGV)) {
    @F = ("STDIN");
  }
  @tru::ARGV=@F;
  $stream=$opt_stream;
  $_ = join(' ',@F);
  tru::begin();
  if (!($stream)) {
    *tru::macro_in  = \&tru::macro_in_depth;
    *tru::macro_out = \&tru::macro_out_depth;
    *tru::write     = \&tru::write_depth;
  } else {
    *tru::macro_in  = \&tru::macro_in_seq;
    *tru::macro_out = \&tru::macro_out_seq;
    *tru::write     = \&tru::write_seq;
  }
  if ($opt_debug and !$opt_debActionMap and $stream) {
    *tru::write = sub {};
  }
  binmode(STDOUT);
  $rnr = $rnr[0]=1;
  $level               = 0;
  $NrOfLinesFollowing  = 0;
  $NrOfChilds          = 0;
  $tru::Oi             = 0;                        # would be "" (blank) (rsp. undef) if initial
  $tru::active_rule_nr = 0;
  $tru::maxsubinc      = 0;
  $tru::active_state   = 'DOC';
  tru::macroin("DOC","DOC",-1);
  while (1) {
    $level=1;
    $indent="";
    if (@tru::xREAD) {
      $tru::origin = 'x';                          # @xREAD
      $_      = shift @tru::xREAD;
      $.      = shift @tru::xREADl;
      if (/^$sdel$/o) {
        #****************************************
        # processing empty lines
        #****************************************
        # tru::read cannot be applied here
        #****************************************
        $_ = $indent = '';
        $level  = $tru::xREADlevel4empty;
      } else {
        $level  = $tru::xREADlevel;
      }
    } else {
      if (@ATTIC) {
        $tru::origin = 'A';                        # @ATTIC
        $_ = shift @ATTIC;
      } elsif ($_=<>) {
        $tru::origin = 'S';                        # Stdin
        chomp;
      } else {
        last;
      }
      if (/^$/) {
        push @tru::xREADl,$.;
        $tru::empty++;
        next;
      }
      $level += tru::indentval((m/(^\t* *)/,$1));
      if ($tru::origin eq 'S') {
        $tru::ret = tru::read();
        if ($tru::ret == 1) {
          next;
        }
        if ($tru::ret == 2) {
          last;
        }
      } elsif ($tru::origin eq 'A') {
        $tru::ret = tru::atticread();
        if ($tru::ret == 1) {
          next;
        }
        if ($tru::ret == 2) {
          last;
        }
      }
      if ($tru::empty) {
        $tru::xREADlevel=$level;
        tru::prepare_xREAD();
        push @tru::xREAD,$_;
        push @tru::xREADl,$.;
        next;
      }
    }
    s/(^\t* *)//;
    if ($tru::origin ne 'x' and $_ eq '') {
      print STDERR "tru : warning : stray blanks in an empty line at $ARGV @ $.\n";
    }
    $indent = $1;
    $tru::olevel=$level;
    $tru::lnr = $.;
    while (@tru::actions && $level <= $tru::actions[-1][0]) {
      tru::macroout();
    }
    $. = $tru::lnr;
    @F = split /$delim/o;
    tru::splitapply();
    $tru::relativeIndent = $level - $tru::actions[-1][0];
    $rnr = ++$rnr[$level];
    $#rnr = $level;                                # shorten array
    $tru::active_rule_nr = 0;
    $tru::active_state   = 'UNMATCHED';
    if (tru::check()) {
      tru::macroin("UNMATCHED","UNMATCHED",$tru::statesi[-1]-1);
    }
  }
  continue {
    if (!@ATTIC and !@tru::xREAD) {
      if (eof) {
        $level = -1;
        if ($tru::empty) {
          tru::prepare_xREAD();
        } else {
          tru::newfile();
          # here $ARGV holds the name of the now to be closed file
          #      $ARGV[0] holds the name of the next file to be opened
        }
      }
    }
  }
  $level = -1;
  while (@tru::actions && $level <= $tru::actions[-1][0]) {
    tru::macroout();
  }
  while (@tru::Marks_name_Oi) {
    unusemark();
  }
  #****************************************
  # from here on we do not need to save the current Oi, it will no longer be used
  #****************************************
  # ---------------------------------------------------------------------------------
  #****************************************
  for my $markName  (sort keys %tru::HMarks) {
    if ($tru::HMarks{$markName}[1]) {
      #****************************************
      # mark was used
      #****************************************
      $tru::Oi=$tru::HMarks{$markName}[2];
      tru::umacro($markName,']');                  # apply the ]-hook
    } else {
      #****************************************
      # apply the n-hook for  not used marks
      #****************************************
      # we cannot use usemark($markName) here since this would trigger [ and ]
      #****************************************
      $tru::Oi=$tru::HMarks{$markName}[2];         # Oi
      tru::umacro($markName,'n');                  # mark was not used, apply this hook
    }
  }
  tru::flush();
  if (@K = sort keys %tru::Saved) {
    print STDERR "$0 : some text was never output (due to unset marks) when processing $ARGV\n";
    for $symname (@K) {
      print STDERR "  For mark $symname\n";
      for (@{$tru::Saved{$symname}}) {
        print STDERR "\t$_";
      }
      $K[$i] = 0;
    }
  }
}

sub tru::subinc(*)
{
  local (*a) = @_;
  local $apre = $a;
  $a+=0.00001;
  if (int($a) != int($apre)) {
    die "Too many marks or too many recursions in $0 @tru::ARGV\n";
  }
}

sub tru::prepare_xREAD
{
  if ($tru::olevel > $level) {
    $tru::emptyLineIsLast = $tru::empty+1;
    $level = $tru::olevel;
  }
  for (;$tru::empty;$tru::empty--) {
    push @tru::xREAD,$sdel;
  }
  $tru::xREADlevel4empty=$level;
}

sub tru::setOutputFile
{
  if (!(open (STDOUT,">$opt_o"))) {
    print STDERR "$0 : cannot open '$opt_o' for writing : $!\n";
    exit(1);
  }
}

sub tru::indentval($)
{
  local ($indent) = @_;
  ($indent =~ y/\t/\t/)*8 + ($indent =~ y/ / /);
}

sub tru::doc
{
  open EXE,$0 or die "cannot open $0 : $!";
  while (<EXE>) {
    if (/^#actions start$/.../^#actions end$/ or /^#hooks start$/.../^#hooks end$/) {
      if (s/^##  ([^ ])/$1/) {
        print;
      }
      if ($seq = /^=/.../^=cut$/) {
        if (!($seq ==1 or $seq =~ /E0$/)) {
          s/^\t//;
          print;
        }
      }
    }
  }
  exit(0);
}

sub tru::source
{
  open EXE,$0 or die "cannot open $0 : $!";
  while (<EXE>) {
    if (/^#version start$/.../^#version end$/) {
      if (s/^VERSION\t//) {
        s/\t/ : /;
        print "VERSION\t$_";
      }
    }
    if (/^#here start$/.../^#here end$/) {
      if (s/^##// or /^\t/ or /^$/) {
        print;
      }
    }
    if (/^#simple start$/.../^#simple end$/) {
      if (s/^##//) {
        print;
      } elsif (s/^\t//) {
        print;
      }
    }
    if (/^#actions start$/.../^#actions end$/ or /^#hooks start$/.../^#hooks end$/) {
      if (s/^##//) {
        print;
      } elsif (s/^\t//) {
        print;
      } elsif (/^$/) {
        print;
      } elsif (/^  \{tru::parse\(/../\)}$/) {
        s/^  \{tru::parse\(/              /;
        s/\)}$//;
        if ($_ eq "                 '',\n") {
          print "       |\n";
        } else {
          s/                 q./\t/;
          s/.,$//;
          s/\\\\/\\/g;
          print;
        }
      }
    }
  }
  if (!($opt_macros)) {
    tru::structure();
  }
  exit 0;
}

sub tru::respecial
{
  s/^#:#\t/\t/;
  s/^( +)tru::macro_in_witharg\(0,qq$sdel(.*)$sdel,qq$sdel(.*)$sdel\);/$1>>$2\t$3/; # >>action<tab>arg
  s/^( +)tru::macro_in_witharg\(1,qq$sdel(.*)$sdel,qq$sdel(.*)$sdel\);/$1->$2\t$3/; # ->action<tab>arg
  s/^( +)for \(local \$tru::first_and_only_run,usemark\((\\\$.*?)\);!\$tru::first_and_only_run;\$tru::first_and_only_run\+\+,unusemark\(\)\)/$1atmark($2)/; # atmark($mark_x)
  s/^( +)for \(local \$tru::rpos = \@tru::actions, local \$tru::first_and_only_run,tru::macro_in_witharg\(0,qq$sdel(.*?)$sdel,qq$sdel(.*?)$sdel\);!\$tru::first_and_only_run;\$tru::first_and_only_run\+\+,tru::macro_out_forced\(\$tru::rpos\)\) {/$1-->$2\t$3\t{/; # -->action<tab>arg
}

sub tru::structure
{
  open EXE,$0 or die "cannot open $0 : $!";
  binmode(STDOUT);
  while (<EXE>) {
    if (/^sub tru::check\(\)/.../^}/) {
      if ($opt_groupExpand) {
        if (/^    # groups start here\n/.../^    # groups end here\n/) {
          next;
        }
        if (/=g\n/) {
          next;
        }
        if (s/^   #g//) {
          print;
        }
      }
      if ($opt_vstructure or $opt_source) {
        if (s/^  #//) {
          print;
        }
      } else {
        if (s/^  #(?!#file)//) {
          print;
        }
      }
    }
  }
  exit 0;
}

sub tru::actionArgsIn
{
  #****************************************
  # transfer the arguments
  #****************************************
  # each arg results in
  #   $arg	filled with the corrsponding field
  #   @arg	a stack for this arg
  #****************************************
  *tru::arglist=\@{$tru::actioncode{'args'}{$tru::action}};
  for (my $i=0;$i<@tru::arglist;$i=$i+1) {
    *tru::arg=\$tru::arglist[$i];
    push @$tru::arg,$F[$i];
    *$tru::arg = \$$tru::arg[-1];
  }
  #****************************************
  # initialize the stacked-locals
  #****************************************
  # each local results in
  #   $local	initialized to ""
  #   @local	a stack for this arg
  #****************************************
  *tru::arglist=\@{$tru::actioncode{'locals'}{$tru::action}};
  for (my $i=0;$i<@tru::arglist;$i=$i+1) {
    *tru::arg=\$tru::arglist[$i];
    push @$tru::arg,"";
    *$tru::arg = \$$tru::arg[-1];
  }
}

sub tru::actionArgsOut
{
  for my $namespace ('args','locals') {
    *tru::arglist=\@{$tru::actioncode{$namespace}{$tru::action}};
    for (my $i=0;$i<@tru::arglist;$i=$i+1) {
      *tru::arg=\$tru::arglist[$i];
      pop @$tru::arg;
      if (@$tru::arg) {
        *$tru::arg = \@$tru::arg[-1];
      }
    }
  }
}

sub tru::macroin($$$)
{
  local ($state,$tru::action,$offs) = @_;
  tru::actionArgsIn();
  push @tru::states,$state;
  push @tru::statesi,$offs;
  push @tru::actions,[ $level ,$tru::action ,[@F] ,$_ ,$.  ,$indent ,$tru::active_rule_nr ,$tru::active_state ];
  # I need $. only in depth-mode, it can be savely dismissed, if in seq-mode
  # The parser does not use this value, it's here only for convenience and can be savely dismissed even in depth-mode if not used in the .tru-file
  if ($tru::statesi[-1] == -1) {
    if (@tru::NrOfChilds) {
      if ($F[0] ne "") {
        #****************************************
        # empty lines don't count for NrOfChilds
        #****************************************
        $tru::NrOfChilds[-1]++;
      }
    }
    push @tru::NrOfChilds,0;
  }
  tru::macro_in();
}

sub tru::macro_in_seq
{
  tru::umacro($tru::action,'>');
  tru::umacro($tru::action,'-');
}

sub tru::macro_out_seq
{
  tru::umacro($tru::action,'<');
}

sub tru::inRange
{
  my $i;
  if (!($tru::RangeParsed)) {
    $tru::RangeParsed=1;
    $opt_debRange =~ s/ //g;
    my @sr = split /,/,$opt_debRange;
    my ($from, $to);
    for (@sr) {
      if (($from,$to) = /^(\d*)\-(\d*)$/) {
        if (!($from)) {
          $from = 1;
        }
      } elsif (($from) = /^(\d+)$/) {
        $to = $from;
      } else {
        print STDERR "invald range specification : $_\n";
        exit(1);
      }
      push @tru::Ranges, [ $from , $to ];
    }
  }
  for ($i=0;$i<@tru::Ranges;$i=$i+1) {
    if ($. >= $tru::Ranges[$i][0] and (!$tru::Ranges[$i][1] or $. <= $tru::Ranges[$i][1])) {
      return 1;
    }
  }
  return 0;
}

sub tru::debug
{
  my ($action,$pit) = @_;
  if ($opt_debRange and !tru::inRange()) {
    return;
  }
  if ($level == -1) {
    return;                                        # processing !n at the end
  }
  if ($opt_debStructure) {
    if ($pit eq '>' and $. != $tru::lastDot and !$tru::isTriggered) {
      print "$action\t$indent$_\n";
      $tru::lastDot = $.;
    }
  } else {
    if (!$opt_deball and  !defined(&{$tru::actioncode{$pit}{$action}})) {
      return;
    }
    print "$.\t$level\t$rnr\t",(!defined(&{$tru::actioncode{$pit}{$action}}))?"!":"","$pit\t$action\t";
    print "$sdel$tru::actions[$_][6]" for 0..$#tru::actions; # active_rule_nr
    print "\t";
    print "$sdel$tru::actions[$_][1]" for 0..$#tru::actions; # action
    print "\t";
    print "$sdel$tru::actions[$_][4]" for 0..$#tru::actions; # $.
    print "\t$_\n";
  }
}

sub tru::umacro($$)
{
  (my $action,local $tru::pit) = @_;
  local $level=$level;                             # allow machines to play around with $level
  if ($opt_debug) {
    if ($opt_debActionMap) {
      if (defined(&{$tru::actioncode{$tru::pit}{$opt_debActionMap}})) {
        &{$tru::actioncode{$tru::pit}{$opt_debActionMap}};
      }
      return;
    } else {
      tru::debug(@_);
      if ($opt_debStructure) {
        return;
      }
    }
  }
  if (defined(&{$tru::actioncode{$tru::pit}{$action}})) {
    &{$tru::actioncode{$tru::pit}{$action}};
  }
}

sub tru::parse
{
  local *tru::A = \@_;
  local $tru::line;
  for $tru::line (@tru::A) {
    tru::debRev() if (defined($opt_debReverse));
    local @tru::W;
    local $tru::liney;
    local $tru::linex;
    eval qq(\$tru::liney = qq$sdel$tru::line$sdel);
    if (!(@tru::W = split /\n/,$tru::liney,-1)) {
      @tru::W = ('');
    }
    for $tru::linex (@tru::W) {
      tru::write($tru::linex);
    }
  }
}

sub tru::debRev
{
  my $filename = $ARGV || "<none>";
  my $pit=$tru::pit;
  if ($pit eq '') {
    #****************************************
    # we have no pit if we are called from a special like READ or SPLITAPPLY
    #****************************************
    $pit = 's';
  }
  $tru::debRev="$filename\t$.\t$pit\t";
  $tru::debRev.="$sdel$tru::actions[$_][6]" for 0..$#tru::actions;
  $tru::debRev.="\t";
  $tru::debRev.="$sdel".$tru::actions[$_][7] for 0..$#tru::actions;
  $tru::debRev.="\n";
}

sub tru::macro_out_forced($)
{
  local ($rpos) = @_;
  while ($rpos < @tru::actions) {
    tru::macroout();
  }
}

sub tru::macro_in_witharg
{
  (my $flag,my $macro,local $_) = @_;
  local @F;
  @F = split /$delim/o;
  if ($macro eq "") {
    $macro = $F[0];
  }
  #$tru::active_rule_nr = -1
  $tru::active_state   = $macro;
  my $rpos = @tru::actions;
  tru::macroin($F[0],$macro,$tru::statesi[-1]-1);
  if ($flag) {
    tru::macro_out_forced($rpos);
  }
}

sub tru::macroout
{
  $state = pop @tru::states;
  $NrOfChilds = $tru::NrOfChilds[-1];
  local $tru::tillhere = @tru::actions;
  if (pop @tru::statesi == -1) {
    pop @tru::NrOfChilds;
  }
  local $tru::lnr = $.;
  local $isLast = $level < 0 || $level < $tru::actions[-1][0] || $tru::emptyLineIsLast;
  $tru::emptyLineIsLast = 0;
  local ($level,$tru::action,*F ,$_ ,$. ,$indent ,$tru::active_rule_nr ,$tru::active_state) = @{ @tru::actions[-1] };
  $rnr = $rnr[$level]+0;
  tru::macro_out();
  while (@tru::actions > $tru::tillhere) {
    tru::macroout();
  }
  tru::actionArgsOut();
  pop @tru::actions;
  $. = $tru::lnr;
}

sub tru::getrindent($)
{
  local ($implicitIndent) = @_;
  my $i;
  #****************************************
  # find the last action enclosing the tabaligned action
  #****************************************
  for ($i=$#tru::actions;$i>=0;$i--) {
    if ($tru::actions[$i][8]) {
      last;
    }
  }
  $i = $tru::actions[$i][0]+$implicitIndent-1;
  my $requiredLevel = (int($i/8)+($i%8 > 0))*8;
  $i=0;
  for (my $j=0;$j<$requiredLevel;$i++) {
    if (substr($indent,$i,1) eq "\t") {
      $j+=8;
    } else {
      $j++;
    }
  }
  return ( substr($indent,$i) , $level-$requiredLevel-1 );
}

sub debout($)
{
  local ($_) = @_;
  #  print STDERR $_
}

sub tru::CheckStatesPath($$$**$)
{
  local ($indicator,$tabaligned,$star,*M,*I,$implicitIndent) = @_;
  if (@$M > @tru::states) {
    return 0 # more to match than states available -> no match;
  }
  if ($tabaligned) {
    my $i = $tru::actions[-1][0]+$implicitIndent-1;
    my $requiredLevel = (int($i/8)+($i%8 > 0))*8+1;
    if ($star == 2) {
      if ($level <  $requiredLevel) {
        return 0 # indent for "tabaligned dangling"  ( >>t*  =t*    >t*  ) too small  -> no match;
      }
    } else {
      if ($level != $requiredLevel) {
        return 0 # indent for "tabaligned"           ( >>t   =t     >t   ) too small  -> no match;
      }
    }
  } elsif ($star == 2) {
    if ($implicitIndent > $tru::relativeIndent) {
      return 0 # indent for "dangling"             ( >*    >>*    =*   ) too small  -> no match;
    }
  } else {
    if ($implicitIndent != $tru::relativeIndent) {
      return 0 # indent for "fixed"                ( >>3   ==3    >3   ) incorrect  -> no match;
    }
  }
  #debout "--------:-\@ : $_\n"
  #debout "Line Nr : $.\n"
  #debout "M       : ".@$M           ." : @$M\n"
  #debout "I       : ".@$I           ." : @$I\n"
  #debout "states  : ".@tru::states  ." : ". join("/",@tru::states)."\n"
  #debout "statesi : ".@tru::statesi ." : @tru::statesi\n"
  #debout "actions : ".@tru::actions ." :\tlevel/action/\@F/f/indent // only first element of \@F is shown"
  #debout "\n\t\t$tru::actions[$_][0]/$tru::actions[$_][1]/$tru::actions[$_][2][0]/$tru::actions[$_][3]/$tru::actions[$_][4]/$tru::actions[$_][6]" for 0..$#tru::actions;debout "\n"
  #debout "tru::relativeIndent      : $tru::relativeIndent\n"
  #debout "implicitIndent      : $implicitIndent\n"
  my $ret= tru::csp(0,0);
  #debout "returns $ret\n"
  return $ret;
}

sub tru::csp($$)
{
  local ($i,$j) = @_;
  my $ret;
  #debout "$i,$j : $$M[$i],$tru::states[$j]\n"
  if ($tru::statesi[$j] < -1) {
    #debout "not -1 in statesi, skip\n"
    return tru::csp($i,$j+1);
  }
  if ($i > $#$M) {
    if ($indicator eq "=") {
      #debout "everything eaten and =, checking j >= tru::states\n"
      return ($j >= @tru::states);
    } else {
      #debout "everything eaten and >, good\n"
      return 1;
    }
  }
  if ($$I[$i]) {
    if ($tru::states[$j] eq $$M[$i]) {
      #debout "= assured, good\n"
      return tru::csp($i+1,$j+1);
    } else {
      #debout "= not assured, bad\n"
      return 0;
    }
  } else {
    while ($j < @tru::states) {
      if ($tru::statesi[$j] == -1 and $tru::states[$j] eq $$M[$i]) {
        #debout "skipped to $j,$i, good\n"
        my $ret = tru::csp($i+1,$j+1);
        #debout "no match, check next position\n"
        if ($ret) {
          return $ret;
        }
      }
      $j++;
    }
  }
  return 0;
}

sub tru::write_seq
{
  local ($_) = @_;
  if (tru::write_apply()) {
    return;
  }
  if (defined($opt_debReverse)) {
    if (++$tru::Outputlinecount == $opt_debReverse or !$opt_debReverse) {
      print $tru::debRev;
    }
  } else {
    print "$_\n";
  }
}

sub tru::showTruOptions
{
  ## Hand written stuff	5
print STDERR
q(       -help			show help
       -version			show the version information
       -o:file			Write output to this file (instead of STDOUT)
       -vhelp			show detailed help
       -ohelp			only show the options
       -ovhelp			only show the tru-general options
       -stream			use stream mode
       -debug			don't parse, just print debug output
       -deball			for -debug : also output for actions without code
       -debStructure		for -debug : just trace the structure
       -debActionMap:action	for -debug : map all actions to this <action>
       -debRange:range		for -debug only print lines from <range>
       -debReverse:nr		reverse debug for outputline <nr>
       -structure		show structure and exit
       -vstructure		show structure including file-info and exit (can also be applied to -source)
       -groupExpand		only together with -structure or -vstructure : expand groups
       -source			show source and exit
       -macros			show macros (no structure) and exit
       -doc			show the docs and exit
);
  ## Resuming generated code
}
#****************************************
# $tru::unsetMarkActive				name of the not yet set mark, used for saving text
# @tru::ActiveMark_name_Oi_unsetMarkActive	[ $markName , $tru::Oi, $tru::unsetMarkActive ]				marks in use            ,                                  Oi shifted if > Oi
# @tru::Marks_name_Oi				[ $markName , $tru::Oi ]						Oi after {, needed for -,                                  Oi shifted if > Oi
# @tru::Or					Oi									only in macro_out_depth, remember the pos for <-action     Oi shifted if >= Oi
# @tru::Aoi					Oi									position for the - action, and position before the ] hook  Oi shifted if > Oi
# %tru::HMarks					$markName             -> [ setmark_count , usemark_count  , Oi ]	usemark_count counts the usage after the last setmark      Oi shifted if > Oi
# %tru::Saved					$tru::unsetMarkActive -> [ text ]
#****************************************

sub tru::write_depth
{
  local ($_) = @_;
  if (!($tru::processingSavedText)) {
    if (tru::write_apply()) {
      return;
    }
    s/$/\n/;
    if ($opt_debRange and ! tru::inRange()) {
      $_ = "";
    }
    if (defined($opt_debReverse)) {
      $_ = $tru::debRev;
    }
  }
  if (defined($tru::unsetMarkActive)) {
    push @{ $tru::Saved{$tru::unsetMarkActive} },$_; # mark is not yet set, remember this line
  } else {
    #****************************************
    # the line can be inserted into tru::O at the position tru::Oi
    #****************************************
    # all pointers behind tru::Oi must be incremented
    #****************************************
    my $a=$_;
    chomp($a);
    while ((my $key,my $ref) = each %tru::HMarks) {
      $$ref[2] >  $tru::Oi and $$ref[2]++;
    }
    map {
      $_       >  $tru::Oi and $_++;
    } @tru::AOi;
    map {
      $$_[1]   >  $tru::Oi and $$_[1]++;
    } @tru::Marks_name_Oi,@tru::ActiveMark_name_Oi_unsetMarkActive;
    map {
      $_       >= $tru::Oi and $_++;
    } @tru::Or;
    splice(@tru::O,$tru::Oi++,0,$_);
  }
}

sub tru::shiftMarks
{
  while ((my $key,my $ref) = each %tru::HMarks) {
    $$ref[2]  >  $tru::Oi   and   int($$ref[2]) == int($tru::Oi)   and   tru::subinc(\$$ref[2] );
  }
  map {
    $_        >  $tru::Oi   and   int($_)       == int($tru::Oi)   and   tru::subinc(\$_       );
  } @tru::AOi;
  map {
    $$_[1]    >  $tru::Oi   and   int($$_[1])   == int($tru::Oi)   and   tru::subinc(\$$_[1]   );
  } @tru::Marks_name_Oi,@tru::ActiveMark_name_Oi_unsetMarkActive;
  map {
    $_        >= $tru::Oi   and   int($_)       == int($tru::Oi)   and   tru::subinc(\$_       );
  } @tru::Or;
}
### 
#  triggers >

sub tru::macro_in_depth
{
  push @tru::AOi,-1;                               # correct value not yet known
  my $Opos = $#tru::AOi;
  tru::umacro($tru::action,'>');
  # now the value for the Oi on the stack (for the depth-action) is known.
  #   The correct stack-position in @tru::AOi is $Opos
  # if there were some actioncalls ( >>action ) in the in-action then some internal Arrays may now be larger.
  if ($#tru::AOi-$Opos) {
    tru::shiftMarks();
    tru::subinc(\$tru::Oi);
  }
  $tru::AOi[$Opos] = $tru::Oi;
}
### 
#  triggers - and <

sub tru::macro_out_depth
{
  push @tru::Or,$tru::Oi;
  $tru::Oi=pop(@tru::AOi);
  local $NrOfLinesFollowing = int($tru::Or[-1])-int($tru::Oi); # just output-lines
  my $rpos = @tru::actions;
  tru::umacro($tru::action,'-');
  $tru::Oi=pop @tru::Or;
  while ($rpos < @tru::actions) {
    tru::macroout();
  }
  tru::umacro($tru::action,'<');
}
#****************************************
# public section
#****************************************
# these functions can be used in the truer
# Note : atmark("mark") is a literally translated into the equivalent sequence
#   usemark("mark");
#   {
#       the body of atmark()
#   }
#   unusemark();
#   
#****************************************
### 
#  set a mark at the current cursor-position
#  if there is saved text for this mark, then this text is now outputted

sub setmark($)
{
  my ($markName) = @_;
  debout "setmark $markName $tru::Oi\n";
  tru::shiftMarks();
  if ($tru::HMarks{$markName}[0]) {
    #****************************************
    # mark was already set and ....
    #****************************************
    if ($tru::HMarks{$markName}[1]) {
      #****************************************
      # ... was used, apply the ]-hook
      #****************************************
      push @tru::AOi,$tru::Oi;
      $tru::Oi = $tru::HMarks{$markName}[2];
      tru::umacro($markName,']');
      $tru::Oi=pop(@tru::AOi);
    } else {
      #****************************************
      # ... was not used, apply its n-hook
      #****************************************
      push @tru::AOi,$tru::Oi;
      $tru::Oi=$tru::HMarks{$markName}[2];         # Oi
      tru::umacro($markName,'n');                  # mark was not used, apply this hook
      $tru::Oi=pop(@tru::AOi);
    }
  }
  $tru::HMarks{$markName}[0]++;                    # setmark_count
  $tru::HMarks{$markName}[1] = 0;                  # usemark_count
  if ($tru::unsetMarkActive eq $markName) {
    undef $tru::unsetMarkActive;
  }
  if (defined $tru::Saved{$markName}) {
    $tru::processingSavedText = 1;
    for (@{$tru::Saved{$markName}}) {
      tru::write($_);
    }
    $tru::processingSavedText = 0;
    delete $tru::Saved{$markName};
    $tru::HMarks{$markName}[1]++;                  # usemark_count
  }
  $tru::HMarks{$markName}[2] = $tru::Oi;           # Oi
  tru::subinc(\$tru::Oi);
}
### 
#  use the mark $markName
#  the cursor is positioned at the line indicated by this mark
#  $usemark_count for this mark is incremented and can be accessed in the truer
#  also triggers the '[' and '{' markhook (if first usage)

sub usemark($)
{
  my ($markName) = @_;
  $tru::HMarks{$markName}[1]++;                    # usemark_count
  push @tru::ActiveMark_name_Oi_unsetMarkActive,[ $markName,$tru::Oi,$tru::unsetMarkActive ]; # context - restored at unusemark
  if ($tru::HMarks{$markName}[0]) {
    # mark is set, we can use it
    $tru::Oi=$tru::HMarks{$markName}[2];           # Oi
    debout "usemark $markName $tru::Oi\n";
    undef $tru::unsetMarkActive;
  } else {
    # mark is not yet set, prepare for storing text for first occurance of setmark for this mark
    $tru::unsetMarkActive = $markName;
  }
  $usemark_count = $tru::HMarks{$markName}[1];     # usemark_count, can be accessed as $usemark_count in the user-truers hooks
  if ($usemark_count == 1) {
    #****************************************
    # first usage of this mark
    #****************************************
    tru::umacro($markName,'[');                    # apply the [-hook
  }
  tru::umacro($markName,'{');                      # apply the {-hook
  push @tru::Marks_name_Oi, [ $markName , $tru::Oi ]; # remember Oi for the - hook
}
### 
#  unuse the current mark and return to the previous mark (if any)
#  also triggers the '-' and '}' markhook

sub unusemark
{
  push @tru::AOi,$tru::Oi;
  ( my $markName, $tru::Oi) = @{ pop @tru::Marks_name_Oi };
  debout "unusemark $markName $tru::Oi\n";
  $usemark_count = $tru::HMarks{$markName}[1];     # usemark_count can be accessed in the user-truers hooks
  tru::umacro($markName,'-');
  $tru::Oi=pop(@tru::AOi);
  tru::umacro($markName,'}');
  $tru::HMarks{$markName}[2] = $tru::Oi;           # the mark is still valid, it can be reused again.
  ($tru::tmp,$tru::Oi,$tru::unsetMarkActive)=@{ pop @tru::ActiveMark_name_Oi_unsetMarkActive }; # restore context
}
### 
#  make a copy of mark $from into mark $to

sub clonemark($$)
{
  local ($from,$to) = @_;
  debout "clonemark $from -> $to\n";
  $tru::HMarks{$to}[0]++;                          # setmark_count
  $tru::HMarks{$to}[1] = 0;                        # usemark_count
  $tru::HMarks{$to}[2] = $tru::HMarks{$from}[2];   # Oi
}
1;
