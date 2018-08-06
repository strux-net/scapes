#!/usr/bin/perl
#
# Autogenerated from perl_tru using trusubs.plTR
# do not edit this file, look for trusubs.plTR and change this
# or you may loose all your changes and probably choose the wrong method.
# goto http://www.strux.net to find more information.
#
#  protos
sub statistics($);
sub max($$);
sub StructureItem($);
sub matchstr;
sub warning($@);
sub syntax($@);
sub validityCheck($);
sub fillInvalidNames;
# based on trusubs.plTR , version : 4.0
#
# trusubs.pl is required by tru and should be located in ~/strux/lib
#

sub statistics($)
{
  local ($STAT) = @_;
  open STAT,">$STAT" or die "cannot open $STAT : $!";
  $oldfh = select(STAT);
  print "  H\t>\t-\t<\td\ts\tname\n";
  for $Action (sort keys %Seen) {
    print "  ${\( $Seen{$Action}{'H'}+0 )}";       # hits in the action-section
    print "\t${\( $Seen{$Action}{'>'}+0 )}";       # definitions for >
    print "\t${\( $Seen{$Action}{'-'}+0 )}";       # definitions for -
    print "\t${\( $Seen{$Action}{'<'}+0 )}";       # definitions for <
    print "\t${\( $Seen{$Action}{'d'}+0 )}";       # short descriptions
    print "\t${\( $Seen{$Action}{'s'}+0 )}";       # used in structure
    print "\t$Action";
    print "\n";
  }
  select($oldfh);
}

sub max($$)
{
  local ($a,$b) = @_;
  if ($a > $b) {
    return $a;
  } else {
    return $b;
  }
}

sub StructureItem($)
{
  local ($_) = @_;
  $creepLocked=1;
  while (s/^(\t*)\t/$1        /) {
  }
  ($level) = /(^ +)/;
  $level = length($level);                         # level = indent (leading tabs count 8 spaces)
  s/^ +//;                                         # we now have level and don't need the indent
  if ($_ eq "") {
    #****************************************
    # an empty structureitem is a special case and is only produced when closing an action
    #****************************************
    $_="UNMATCHED\t*\t>*0\t.+";
    $creepLocking=1;
  } else {
    $creepLocking=0;
  }
  local $indicator;
  local $explicitIndent;
  local $dangling = 0;
  ($pattern,$givenindicator,$regexp) = split /\t+([=>][^\t]*)/,$_,3;
  if ($givenindicator) {
    $indicator=$givenindicator;
  } else {
    $indicator="=";
  }
  $regexp =~ s/\t+//;
  @names = split /\t+/,$pattern;
  ($prio,$isgroup,$open4creep,$tabaligned,$star,$explicitIndent,$state,$cond) = $indicator =~ /^(=|>|>>)(g)?(o)?(t)?(\*)?(\d+)?(?: +(.+?))?(?:\((.+)\))?$/;
  if ($isgroup eq "g") {
    if ($prio ne "=") {
      syntax 'prio for using a group must be "="',$prio;
    }
    $ingroup++;
    if (@names > 1) {
      syntax 'too many names in group usage';
    }
    unshift @ATTIC,"groupend";
    local ($group_name) = $names[0];
    push @Active_rule_nr_stack,++$active_rule_nr;
    if (!(defined($groups{$group_name}))) {
      warning 'group not defined', $group_name;
    }
    $active_rule_nr = $groups{$group_name}{'rule_nr'};
    if ($groups{$group_name}{'refcount'}++ > $opt_l) {
      syntax 'too many recursions when expanding a group', $group_name;
    }
    local @G = @{$groups{$group_name}{'content'}};
    local $active_level=$level;
    map {
      if (/^  untie$/) {
        #  |      indent      | |        $_        |
        $_=$tru::actions[-2][5].$tru::actions[-2][3];
        $active_level=$tru::actions[-2][0]-1-8;
      } else {
        s/^(\t+ *)/$1.(' 'x$active_level)/e;
      }
    } @G;
    unshift @ATTIC,@G;
    return 0;                                      # not creepLocked
  }
  if ($open4creep) {
    $creepLocked=0;
  }
  $star       = ($star       eq '*')+0;
  $tabaligned = ($tabaligned eq 't')+0;
  if ($explicitIndent eq "") {
    $explicitIndent = -1;
  }
  $#BranchIsOptional =$#BranchCond =$#BranchAction = $#BranchState = $#BranchRuleNr = $#BranchIndicators = $#BranchStar = $#BranchExplicitLevel = $#BranchLevels = $#State = $#I = $level; # shorten or prolongue these stacks
  if ($level < length($LS)) {
    substr($LS,$level) = "1";
  } else {
    $LS.="0"x($level-length($LS))."1";
  }
  if ($state eq "") {
    $state = $names[0];
  }
  if ($prio) {
    $LS=~/(0*)1$/;
    $implicitIndent=length($1)+1;
    if ($explicitIndent > 0 and $level != 0 and $explicitIndent != $implicitIndent) {
      syntax 'explicit with indent';
    }
    if ($state =~ s/^\[(.+)\]$/$1/) {
      $creepLocked=0;
    }
    if ($creepLocking) {
      $current_rule_nr=0;
    } else {
      $current_rule_nr=++$active_rule_nr;
      $Seen{$state}{'s'}++;
    }
    $matchstr = matchstr();
    $maxnamelen = max $maxnamelen,length $state;
    my $inOptional=-1;
    for (my $i=0;$i<@BranchIsOptional-1;$i=$i+1) {
      #****************************************
      # find the index of the last optional action that is not followed by a non optional
      #****************************************
      if (defined($BranchIsOptional[$i])) {
        $inOptional=$i;
      } elsif (defined($BranchAction[$i])) {
        $inOptional=-1;
      }
    }
    # tru::write("    #BranchLevels: /".join('/',@BranchLevels));
    # tru::write("    #BranchExplicitLevel: /".join('/',@BranchExplicitLevel));
    # tru::write("    #BranchIndicators: /".join('/',@BranchIndicators));
    # tru::write("    #BranchStar: /".join('/',@BranchStar));
    # tru::write("    #BranchRuleNr: /".join('/',@BranchRuleNr));
    # tru::write("    #BranchAction: /".join('/',@BranchAction));
    # tru::write("    #BranchState: /".join('/',@BranchState));
    # tru::write("    #BranchIsOptional: /".join('/',@BranchIsOptional));
    # tru::write("    #BranchCond: /".join('/',@BranchCond));
    # tru::write("    #State: /".join('/',@State));
    # tru::write("    #inOptional : $inOptional");
    # tru::write("    #LS : $LS");
    # tru::write("    #implicitIndent : $implicitIndent");
    # tru::write("    #state : $state");
    local $mm = grep(/./,@BranchAction)-1;
    if ($state ne "[]") {
      local $corrected_indicator;
      if ($star) {
        if ($explicitIndent >= 0) {
          $corrected_indicator = "=";              # # >>*2    =*2   >*2
          if ($explicitIndent == 0) {
            $star = 2               # >>*0    =*0   >*0;
          }
        } else {
          $corrected_indicator = $prio;            # # >>*     =*    >*
          $star = 2;
          $explicitIndent = 1;
        }
      } else {
        if ($explicitIndent >= 0) {
          $corrected_indicator = "=";              # # >>2     =2    >2         (on the far left)
        } else {
          if ($explicitIndent == 0) {
            $corrected_indicator = "=";            # # >>0     =0    >0
          } else {
            $corrected_indicator = $prio;          # # >>      =     >
          }
        }
      }
      $tmpstr = "  if ($matchstr ((tru::CheckStatesPath('$corrected_indicator',$tabaligned,$star,    \\[@State]    ,\\[@I],$implicitIndent))"; # # all
      if ($explicitIndent >= 0) {
        if ($star) {
          $tmpstr.=" or (tru::CheckStatesPath('$prio',0,$star,\\[@State '$state' ],\\[@I 0],$explicitIndent))"; # # >>*0  >*0  =*0
        } else {
          $tmpstr.=" or (tru::CheckStatesPath('>',0,0        ,\\[@State          ],\\[@I 0],$explicitIndent))"; # # >>2   >2   =2      (on the far left)
          $dangling = 1;
        }
      }
      tru::write("$tmpstr)) {");
      tru::write("    # not []");
      if ($prio eq ">") {
        tru::write("    if (\$tru::emax == -1 and \$tru::gmax < $mm) {");
        tru::write("      \$tru::gmax = $mm;");
      } elsif ($prio eq "=") {
        tru::write("    if (\$tru::emax < $mm) {");
        tru::write("      \$tru::emax = $mm;");
      } else {
        tru::write("    if (1) {");
      }
      tru::write("      *tru::candidate = sub {");
      tru::write("        \$tru::active_rule_nr = $current_rule_nr;");
      tru::write("        \$tru::active_state   = q$sdel".$state."$sdel;");
      if ($tabaligned) {
        if ($inOptional >= 0) {
          syntax 'tabaligned in an optional';
        }
        tru::write("        local ( \$rindent , \$rlevel ) = tru::getrindent($implicitIndent);");
      }
      tru::write("        tru::macroin(q$sdel$names[0]$sdel,q$sdel$state$sdel,-1);");
      tru::write("      };");
      if ($tabaligned) {
        tru::write("      if (\$tru::actions[-1][6] == $BranchRuleNr[-($BranchLevels[-1]+1)]) {");
        tru::write("        *tru::secondcandiate = \\&tru::candidate;");
        tru::write("        *tru::candidate = sub {");
        tru::write("          \$tru::actions[-1][8]=1;");
        tru::write("          tru::secondcandiate();");
        tru::write("        }");
        tru::write("      }");
      }
      if ($prio eq ">>") {
        tru::write("      last;");
      }
      tru::write("    }");
      tru::write("  }");
      if ($inOptional >= 0 and $matchstr ne "\$F[0] =~ m$sdel^(?:.{0})\$$sdel && (\@F <= 1) &&" and !$creepLocking) {
        $optional_level     = $BranchLevels    [$inOptional];
        $optional_indicator = $BranchIndicators[$inOptional];
        $optional_star      = $BranchStar      [$inOptional];
        $implicitIndent+=$optional_level;
        if (defined($BranchCond[$inOptional])) {
          $matchstr = "$matchstr ($BranchCond[$inOptional]) and"; # triggering an optional only if both conditions match
        }
        if ($BranchExplicitLevel[$inOptional]) {
          $corrected_indicator = '>';
        } else {
          $corrected_indicator = $optional_indicator;
        }
        $tmpstr="  elsif ($matchstr (tru::CheckStatesPath('$corrected_indicator',0,$optional_star,\\[@State[0..$inOptional]],\\[@I[0..$inOptional]],$implicitIndent)";
        if ($BranchExplicitLevel[$inOptional]) {
          $tmpstr.=" or (tru::CheckStatesPath('$corrected_indicator',0,$optional_star,\\[@State[0..$inOptional]],\\[@I[0..$inOptional]],".($implicitIndent-$optional_level+$BranchExplicitLevel[$inOptional]-1)."))";
        }
        tru::write("$tmpstr)) {");
        tru::write("    # trigger an optional $BranchAction[$inOptional]");
        local $mm = grep(/./,@BranchAction[0..$inOptional])-1;
        if ($optional_indicator eq ">" or $optional_indicator eq ">*") {
          tru::write("    if (\$tru::emax == -1 and \$tru::gmax < $mm) {");
          tru::write("      \$tru::gmax = $mm;");
        } else {
          tru::write("    if (\$tru::emax < $mm) {");
          tru::write("      \$tru::emax = $mm;");
        }
        tru::write("      *tru::candidate = sub {");
        tru::write("        \$tru::active_rule_nr = q$sdel$BranchRuleNr[$inOptional]$sdel;");
        tru::write("        \$tru::active_state   = q$sdel$BranchAction[$inOptional]$sdel;");
        tru::write("        {");
        tru::write("          local \$level=\$level;");
        tru::write("          \$level-=$implicitIndent-$optional_level;");
        tru::write("          while (\@tru::actions && \$level <= \$tru::actions[-1][0]) {");
        tru::write("            tru::macroout();");
        tru::write("          }");
        tru::write("          {");
        tru::write("            local \$tru::isTriggered = 1;");
        tru::write("            tru::macroin(q$sdel$BranchAction[$inOptional]$sdel,q$sdel$BranchState[$inOptional]$sdel,-1);");
        tru::write("          }");
        tru::write("          \$tru::active_rule_nr = $current_rule_nr;");
        tru::write("          \$tru::active_state   = q$sdel".$state."$sdel;");
        tru::write("        }");
        tru::write("        tru::macroin(q$sdel$names[0]$sdel,q$sdel$state$sdel,-1);");
        tru::write("      };");
        tru::write("    }");
        tru::write("  }");
      }
    } else {
      if ($givenindicator) {
        warning 'Indicator for [] given';
      }
      if ($inOptional >= 0) {
        $optional_indicator = $BranchIndicators[$inOptional];
        $optional_level     = $BranchLevels    [$inOptional];
        $optional_star      = $BranchStar      [$inOptional];
        tru::write("  if ( (tru::CheckStatesPath('$optional_indicator',0,$optional_star,\\[@State[0..$#State-$implicitIndent]],\\[@I[0..$#I-$implicitIndent]],$optional_level+$implicitIndent))) { # xxx:$LS : $implicitIndent -> $state");
        tru::write("    # an []");
        if ($optional_indicator eq ">" or $optional_indicator eq ">*") {
          tru::write("    if (\$tru::emax == -1 and \$tru::gmax < $mm) {");
          tru::write("      \$tru::gmax = $mm;");
        } else {
          tru::write("    if (\$tru::emax < $mm) {");
          tru::write("      \$tru::emax = $mm;");
        }
        tru::write("      *tru::candidate = sub {");
        tru::write("        unshift \@ATTIC,(' 'x(\$level-1)).qq$sdel\$_$sdel;");
        tru::write("        \$level-=$implicitIndent;");
        tru::write("        \$tru::active_rule_nr = q$sdel$BranchRuleNr[-1]$sdel;");
        tru::write("        \$tru::active_state   = q$sdel$BranchAction[-1]$sdel;");
        tru::write("        local \$tru::isTriggered = 1;");
        tru::write("        tru::macroin($State[-$implicitIndent] $State[-$implicitIndent] -1);");
        tru::write("        \$level+=$implicitIndent;");
        tru::write("      };");
        if ($optional_indicator =~ ">>") {
          tru::write("      last;");
        }
        tru::write("    }");
        tru::write("  }");
      } else {
        syntax '[] misplaced';
      }
    }
  } else {
    syntax 'invalid state',$indicator;
  }
  push @State,"\q${sdel}$names[0]${sdel},";
  push @I,($prio eq "=" and !$star and !$dangling)?"1,":"0,";
  return $creepLocked;
}

sub matchstr
{
  local @regexp = split /\t+/,$regexp;
  local $i;
  $BranchIndicators       [-1]=$prio;
  $BranchStar             [-1]=$star;
  $BranchLevels           [-1]=($explicitIndent != -1?$explicitIndent:$implicitIndent);
  $BranchExplicitLevel    [-1]=($explicitIndent != -1?$implicitIndent:'');
  $BranchRuleNr           [-1]=$current_rule_nr;
  $BranchIsOptional       [-1]=undef;
  $BranchAction           [-1]=$names[0];
  $BranchState            [-1]=$state;
  $BranchCond             [-1]=$cond;
  if (@regexp > @names or @regexp == @names and $names[-1] eq '*') {
    warning 'Too many regexps',$state;
  }
  for (my $i=0;$i<@names;$i=$i+1) {
    if ($names[$i] eq '*' and $i != $#names) {
      warning 'fields after star',$names[$i+1];
      last;
    }
  }
  if ($cond ne "") {
    $r = "($cond) and ";
  } else {
    $r = "";
  }
  $opt = 0;
  for ($i=0;$i<@names;$i=$i+1) {
    if ($names[$i] eq "*") {
      return $r;
    }
    if ($names[$i] =~ s/^\[(.+)\]$/$1/) {
      if ($i) {
        $opt = $i;
      } else {
        $BranchIsOptional[-1]=1;
        $BranchAction    [-1]=$names[0];
      }
    }
    if (!($regexp[$i])) {
      $regexp[$i] = '.*';
    }
    if (!($regexp[$i] =~ "^/")) {
      $regexp[$i] = "m$sdel^(?:$regexp[$i])\$$sdel";
    }
    if (!($regexp[$i] eq "m$sdel^(?:.*)\$$sdel")) {
      #****************************************
      # check the regexp for validity
      #****************************************
      if ($state ne "[]") {
        eval "my \$tmp =~ $regexp[$i]";
        if ($@) {
          $@ =~ s: at .*?$::;                      # remove useless info (for this case)
          syntax 'regular expression error',$i,$@;
        }
      }
      if ($opt) {
        $r .= "(!defined \$F[$i] ||  \$F[$i] =~ $regexp[$i]) && ";
      } else {
        $r .= "\$F[$i] =~ $regexp[$i] && ";
      }
    }
  }
  if ($opt) {
    $r .= "!defined \$F[$i] && (\@F >= $opt) && ";
  } else {
    if ($i == 1) {
      $r .= "(\@F <= 1) &&";
    } else {
      $r .= "(\@F == $i) &&";
    }
  }
}

sub warning($@)
{
  local ($warn,@a) = @_;
  # vars
  %warnstr = (
    'fields after star'                         => "the field '$a[0]' is pointless after the preceding *",
    'Indicator for [] given'                    => "the indicator is ingored",
    'Too many regexps'                          => "you specified more regular expressions than fields in '$a[0]'",
    'arg-name problematic'                      => "Name '$a[0]' is not a wise choice for arg (Perl gives \$$a[0] a special meaning)",
    'arg-name problematic with module English'  => "Name '$a[0]' is not a wise choice for arg (Perl gives \$$a[0] a special meaning) - only if you have 'use English'",
    'first usage should have shortdesc'         => "Exactly the first USAGE should have a short-description",
    'group not defined'                         => "you try to use group '$a[0]' which is not defined",
    'group never used'                          => "the group '$a[0]' was defined but never used",
  );
  if (!($opt_q)) {
    print STDERR "tru : Warning '$warn' in $ARGV @ $.\n\t$warnstr{$warn}\n";
  }
}

sub syntax($@)
{
  local ($error,@a) = @_;
  # vars
  %errstr = (
    'explicit with indent'             => "a non-zero explicit is not allowed with indent",
    'Structure missing'                => "the description of the structure is missing",
    'invalid state'                    => "The specified state  '$a[0]' is not valid",
    '[] misplaced'                     => '[] can only occur after an optional rule',
    'tabaligned in an optional'        => 'tabaligned items are not allowed in optional blocks',
    'arg-name clashes with array-name' => "Name '$a[0]' is not allowed for an arg (Perl gives \@$a[0] a special meaning)",
    'arg-name clashes with special'    => "Name $a[0] is not allowed for arg (Perl gives $a[0] a special meaning)",
    'arg-name is all digits'           => "Name $a[0] is not allowed (Perl gives \$1, \$2 ... a special meaning",
    'arg-name already used'            => "the name '$a[0]' is already defined as arg or local",
    'arg-name redefinition'            => "the name '$a[0]' was already defined as '$a[1]' earlier",
    'arg-name belongs to tru'          => "the name '$a[0]' is a reserved name for tru",
    'regular expression error'         => "for field $a[0] (counting starts at 0)\n\t$a[1]",
    'too many names in group usage'    => "when using a group exactly one name must appear before the =g",
    'cannot add to an existing group'  => "group '$a[0]' was already defined earlier. This group is closed for modifications",
    'too many recursions when expanding a group' => "group was '$a[0]'. you can give option -l to specify a larger limit",
    'prio for using a group must be "="'         => "$a[0] as prio is not supported",
  );
  print STDERR "tru : Syntax Error '$error' in $ARGV @ $.\n\t$errstr{$error}\n";
  exit 1;
}

sub validityCheck($)
{
  local ($_) = @_;
  if ($l=$_,grep($_ eq $l,@{$Locals{$Action}},@{$Args{$Action}})) {
    syntax 'arg-name already used',$_;
  } elsif (defined ${InvalidNames}{Arrays}{$_}) {
    syntax 'arg-name clashes with array-name',$_;
  } elsif (defined ${InvalidNames}{special}{$_}) {
    syntax 'arg-name clashes with special',$_;
  } elsif (/^\d+$/) {
    syntax 'arg-name is all digits',$_;
  } elsif (/^tru::/ or defined ${InvalidNames}{truOwned}{$_}) {
    syntax 'arg-name belongs to tru',$_;
  } elsif (defined ${InvalidNames}{problematic}{$_}) {
    warning 'arg-name problematic',$_;
  } elsif (defined ${InvalidNames}{english}{$_}) {
    warning 'arg-name problematic with module English',$_;
  }
}

sub fillInvalidNames
{
  #****************************************
  # these are the names provided if "use English"
  #****************************************
  ${InvalidNames}{english}{q#ARG#} = 1;
  ${InvalidNames}{english}{q#MATCH#} = 1;
  ${InvalidNames}{english}{q#PREMATCH#} = 1;
  ${InvalidNames}{english}{q#POSTMATCH#} = 1;
  ${InvalidNames}{english}{q#LAST_PAREN_MATCH#} = 1;
  ${InvalidNames}{english}{q#LAST_SUBMATCH_RESULT#} = 1;
  ${InvalidNames}{english}{q#LAST_MATCH_END#} = 1;
  ${InvalidNames}{english}{q#INPUT_LINE_NUMBER#} = 1;
  ${InvalidNames}{english}{q#NR#} = 1;
  ${InvalidNames}{english}{q#INPUT_RECORD_SEPARATOR#} = 1;
  ${InvalidNames}{english}{q#RS#} = 1;
  ${InvalidNames}{english}{q#OUTPUT_AUTOFLUSH#} = 1;
  ${InvalidNames}{english}{q#OUTPUT_FIELD_SEPARATOR#} = 1;
  ${InvalidNames}{english}{q#OFS#} = 1;
  ${InvalidNames}{english}{q#OUTPUT_RECORD_SEPARATOR#} = 1;
  ${InvalidNames}{english}{q#ORS#} = 1;
  ${InvalidNames}{english}{q#LIST_SEPARATOR#} = 1;
  ${InvalidNames}{english}{q#SUBSCRIPT_SEPARATOR#} = 1;
  ${InvalidNames}{english}{q#SUBSEP#} = 1;
  ${InvalidNames}{english}{q#FORMAT_PAGE_NUMBER#} = 1;
  ${InvalidNames}{english}{q#FORMAT_LINES_PER_PAGE#} = 1;
  ${InvalidNames}{english}{q#FORMAT_LINES_LEFT#} = 1;
  ${InvalidNames}{english}{q#LAST_MATCH_START#} = 1;
  ${InvalidNames}{english}{q#FORMAT_NAME#} = 1;
  ${InvalidNames}{english}{q#FORMAT_TOP_NAME#} = 1;
  ${InvalidNames}{english}{q#FORMAT_LINE_BREAK_CHARACTERS#} = 1;
  ${InvalidNames}{english}{q#FORMAT_FORMFEED#} = 1;
  ${InvalidNames}{english}{q#ACCUMULATOR#} = 1;
  ${InvalidNames}{english}{q#CHILD_ERROR#} = 1;
  ${InvalidNames}{english}{q#OS_ERROR#} = 1;
  ${InvalidNames}{english}{q#ERRNO#} = 1;
  ${InvalidNames}{english}{q#EXTENDED_OS_ERROR#} = 1;
  ${InvalidNames}{english}{q#EVAL_ERROR#} = 1;
  ${InvalidNames}{english}{q#PROCESS_ID#} = 1;
  ${InvalidNames}{english}{q#PID#} = 1;
  ${InvalidNames}{english}{q#REAL_USER_ID#} = 1;
  ${InvalidNames}{english}{q#UID#} = 1;
  ${InvalidNames}{english}{q#EFFECTIVE_USER_ID#} = 1;
  ${InvalidNames}{english}{q#EUID#} = 1;
  ${InvalidNames}{english}{q#REAL_GROUP_ID#} = 1;
  ${InvalidNames}{english}{q#GID#} = 1;
  ${InvalidNames}{english}{q#EFFECTIVE_GROUP_ID#} = 1;
  ${InvalidNames}{english}{q#EGID#} = 1;
  ${InvalidNames}{english}{q#PROGRAM_NAME#} = 1;
  ${InvalidNames}{english}{q#COMPILING#} = 1;
  ${InvalidNames}{english}{q#DEBUGGING#} = 1;
  ${InvalidNames}{english}{q#SYSTEM_FD_MAX#} = 1;
  ${InvalidNames}{english}{q#INPLACE_EDIT#} = 1;
  ${InvalidNames}{english}{q#OSNAME#} = 1;
  ${InvalidNames}{english}{q#PERLDB#} = 1;
  ${InvalidNames}{english}{q#LAST_REGEXP_CODE_RESULT#} = 1;
  ${InvalidNames}{english}{q#EXCEPTIONS_BEING_CAUGHT#} = 1;
  ${InvalidNames}{english}{q#BASETIME#} = 1;
  ${InvalidNames}{english}{q#PERL_VERSION#} = 1;
  ${InvalidNames}{english}{q#WARNING#} = 1;
  ${InvalidNames}{english}{q#EXECUTABLE_NAME#} = 1;
  #****************************************
  # these are the names of default perl-vars
  #****************************************
  ${InvalidNames}{problematic}{q#+#} = 1;
  ${InvalidNames}{problematic}{q#-#} = 1;
  ${InvalidNames}{problematic}{q#_#} = 1;
  ${InvalidNames}{problematic}{q#&#} = 1;
  ${InvalidNames}{problematic}{q#`#} = 1;
  ${InvalidNames}{problematic}{q#'#} = 1;
  ${InvalidNames}{problematic}{q#.#} = 1;
  ${InvalidNames}{problematic}{q#/#} = 1;
  ${InvalidNames}{problematic}{q#|#} = 1;
  ${InvalidNames}{problematic}{q#,#} = 1;
  ${InvalidNames}{problematic}{q#\\#} = 1;
  ${InvalidNames}{problematic}{q#"#} = 1;
  ${InvalidNames}{problematic}{q#;#} = 1;
  ${InvalidNames}{problematic}{q#%#} = 1;
  ${InvalidNames}{problematic}{q#=#} = 1;
  ${InvalidNames}{problematic}{q#~#} = 1;
  ${InvalidNames}{problematic}{q#^#} = 1;
  ${InvalidNames}{problematic}{q#:#} = 1;
  ${InvalidNames}{problematic}{q#?#} = 1;
  ${InvalidNames}{problematic}{q#!#} = 1;
  ${InvalidNames}{problematic}{q#@#} = 1;
  ${InvalidNames}{problematic}{q#$#} = 1;
  ${InvalidNames}{problematic}{q#<#} = 1;
  ${InvalidNames}{problematic}{q#>#} = 1;
  ${InvalidNames}{problematic}{q#(#} = 1;
  ${InvalidNames}{problematic}{q#)#} = 1;
  ${InvalidNames}{problematic}{q0} = 1;
  ${InvalidNames}{problematic}{q#[#} = 1;
  ${InvalidNames}{problematic}{q#]#} = 1;
  ${InvalidNames}{problematic}{q#^TAINT#} = 1;
  ${InvalidNames}{problematic}{q#^MATCH#} = 1;
  ${InvalidNames}{problematic}{q#^PREMATCH#} = 1;
  ${InvalidNames}{problematic}{q#^POSTMATCH#} = 1;
  ${InvalidNames}{problematic}{q#^CHILD_ERROR_NATIVE#} = 1;
  ${InvalidNames}{problematic}{q#^ENCODING#} = 1;
  ${InvalidNames}{problematic}{q#^RE_DEBUG_FLAGS#} = 1;
  ${InvalidNames}{problematic}{q#^RE_TRIE_MAXBUF#} = 1;
  ${InvalidNames}{problematic}{q#^OPEN#} = 1;
  ${InvalidNames}{problematic}{q#^UNICODE#} = 1;
  ${InvalidNames}{problematic}{q#^UTF8CACHE#} = 1;
  ${InvalidNames}{problematic}{q#^UTF8LOCALE#} = 1;
  ${InvalidNames}{problematic}{q#^WARNING_BITS#} = 1;
  ${InvalidNames}{problematic}{q#^WIN32_SLOPPY_STAT#} = 1;
  ${InvalidNames}{problematic}{q#ARGV#} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  ${InvalidNames}{problematic}{q##} = 1;
  #****************************************
  # these are the names of default perl-arrays (with use English)
  #****************************************
  ${InvalidNames}{Arrays}{q#F#} = 1;
  ${InvalidNames}{Arrays}{q#INC#} = 1;
  ${InvalidNames}{Arrays}{q#_#} = 1;
  ${InvalidNames}{Arrays}{q##} = 1;
  ${InvalidNames}{Arrays}{q#+#} = 1;
  ${InvalidNames}{Arrays}{q#-#} = 1;
  #****************************************
  # these are strings that cannot be used as a var-name for other reasons
  #****************************************
  # this list is probably (most likely) not complete
  #****************************************
  ${InvalidNames}{special}{q#::#} = 1;
  #****************************************
  # these are names that cannot be used as a var-name since tru owns them
  #****************************************
  ${InvalidNames}{truOwned}{q#ATTIC#} = 1;
  ${InvalidNames}{truOwned}{q##} = 1;
  ${InvalidNames}{truOwned}{q#state#} = 1;
  ${InvalidNames}{truOwned}{q#stream#} = 1;
  ${InvalidNames}{truOwned}{q#delim#} = 1;
  ${InvalidNames}{truOwned}{q#indent#} = 1;
  ${InvalidNames}{truOwned}{q#level#} = 1;
  ${InvalidNames}{truOwned}{q#rindent#} = 1;
  ${InvalidNames}{truOwned}{q#rlevel#} = 1;
  ${InvalidNames}{truOwned}{q#rnr#} = 1;
  ${InvalidNames}{truOwned}{q#NrOfChilds#} = 1;
  ${InvalidNames}{truOwned}{q#isLast#} = 1;
  ${InvalidNames}{truOwned}{q#NrOfLinesFollowing#} = 1;
}
fillInvalidNames();
1;
