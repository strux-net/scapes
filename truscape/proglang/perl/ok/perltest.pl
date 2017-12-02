#!/usr/bin/perl
package Strull;
#
# Autogenerated from perl_tru using perltest.plTR
# do not edit this file, look for perltest.plTR and change this
# or you may loose all your changes and probably choose the wrong method.
# goto http://www.strux.net to find more information.
#
#  protos
sub usage;
sub main;
sub test($$@);
sub another_function(\@$$@);
sub foo;
$opt_a = 0;
$opt_b = '/tmp/perltest.out';
$opt_d = 0;
$opt_t = 0;
$opt_s = '';
if (@ARGV == 1 and $ARGV[0] eq '-?') {
  usage();
}
# based on perltest.plTR , version : 3.0
#****************************************
# about this program
#****************************************
# this program does not serve any special purpose xcept for testing perl_tru
# 
# above line is intentionally left empty
#****************************************
require "AutoLoader.pm";
require "AutoSplit.pm";
# based on perltest.plTR , version : 3.0a
require "Benchmark.pm";
use Date::Manip qw(ParseDate DateCalc UnixDate);
## Hand written stuff	1
$varwithtextacrossmultiplelines = "pure perl-code can be produced
 as you can see here
  You could not write such a thing as statement, since a ; would
  be appended to each line
   These lines can be on every indent (starting from the tab position after perl code.
     Indent is taken relative to the perl code statement
  Even tabs					will be left	as given
  	including tabs at the beginning
  ";

## Resuming generated code
# vars
$i=0;                                              # Test statement
$a=0;
BEGIN {
  $x1=1;
  $x2=2;
}
END {
  $x3=3;
}

sub usage
{
  print STDERR <<'EOU';
usage : perltest arg
this program only serves as a test-suite
it does *NOT* do anything use- or harmfull
It simply shows the possibilities
 You can have any indent here
  1
       2
      3
     4
	 6
         6
Tables look like this
1	2
11	22
111	222
1111	2222
11111	22222
111111	222222
1111111	2222222

Text may have a quote (' or ") or other special characters as $. or @ARGV
OPTIONS:
  -a	Run with option a
        more description for option a
  -b:<outname>	write output to file outname
	default for <outname> is /tmp/perltest.out
        more description for option b
  -d	Just accept this for later usage. Text may have a quote (' or ") or other special characters as $. or @ARGV
  -t	Run test
  -s:<file>	output file
  -version	show version information
EOU
  exit(1);
}

sub main
{
  if ( $ARGV[0] eq "-version" ) {
    print "Version :\n";
    print "  perltest.plTR	3.0\n";
    print "  perltest.plTR	3.0a\n";
    exit 0
  }
  require "AutoLoader.pm";                         # was a problem once
  usage unless @ARGV;
  $b=0;
  $c=0;
  print "Running\n";
  use Getopt::Long;
  usage() if !GetOptions('s=s','t','d','b=s','a'); # Test Option
    # -a : Run with option a
    if ($opt_a) {
      $a=1;                                        # Test case for Option
    }
    # -b : write output to file outname
    if ($opt_b) {
      $b=1;
      ## Hand written stuff	7
      print "you gave me arg b
        thank you very much\n";
      ## Resuming generated code
    }
    # -d : Just accept this for later usage. Text may have a quote (' or ") or other special characters as $. or @ARGV
    # -t : Run test
    if ($opt_t) {
      test(3,4,(5,6));
    }
    # -s : output file
    if ($opt_s) {
      $st="ts";
    }
  print "-a\t$opt_a\n";
  print "-b\t$opt_b\n";
  print "-c\t$opt_c\n";
  print "-d\t$opt_d\n";
  print "-t\t$opt_t\n";
  print "-s\t$opt_s\n";
  if ($a == 1) {
    print "a is one\n";
  } else {
    print "a is not one\n";
  }
  if ($a == 2) {
    print "a is two\n";
  } else {
    print "a is not two\n";
  }
  if ($a == 3) {
    print "a is three\n";
  } elsif ($a == 4) {
    print "a is four\n";
  }
  if (!($a == 0)) {
    print "a is not null\n";
  } else {
    print "a is null\n";
  }
  for ($i=0;$i<70;$i+=10) {
    if ($i && $i<  30) {
      print "$i smaller 30\n";
    } elsif ($i && $i== 40) {
      print "$i equal fourty\n";
      if ($i ==0) {
        print "  i is zero\n";
      } else {
        print "  i is not zero\n";
      }
    } elsif ($i && $i>  40) {
      print "$i greater fourty\n";
    } else {
      print "$i not matched\n";
    }
  }
  if (!($a)) {
    print "Testing negated test\n";
    print "You did not give me a a\n";
  }
  if ($b) {
    # Test if
    loop:
    for ($i=0;$i<5;$i++) {
      $j = $i*$i;
      for ($k=0;$k<=$i;$k++) {
        print ".";
        next loop if $k == 2;
      }
      print " $i : $j\n";
    }
    while ($i--) {
      print " $i\n";
    }
    $i=5;
    # a comment here
    while ($i) {
      print "i : $i\n";
    }
    continue {
      $j--;
      $i--;
    }
    AnotherLabel :
    while ($i++<5) {
      print "$i\n";
    }
  } elsif ($a) {
    print "Thank's for the a\n";
    back: {
      for $i (1,2,3) {
        $j += $i;
      }
      $i = 4;
      for (my $i=10;$i<20;$i=$i+1) {
        print "Nr : $i";
      }
      do {
        print "$i";
        $i--;
      } until	!$i;
    } # back:
  } else {
    # Test else
    print STDERR "you did not give me a b\n";
  }
  # vars
  local ($i,$j,$k) = (
    "ich",
    "du",
    "er",
  );
  my @l = (
    "wir",
    "ihr",
    "sie",
  );
  %m = (
    one => "eins",
    two => "zwei",
  );
  print "$i:$j:$k\n";
  print "@l\n";
  print "$m{two}\n";
  local(
    $B,                                            # a big b
    $C );                                          # a big c
  $x =
    "one".
    'two';
  print(a);
  print($b);
  # a block for 1
  print (1);
  print (1); # code for the 1 function
  print (1); # we have trailing tab 1
  
  # a block for 2
  print (2);
  print (2); # code for the 2 function
  print (2); # we have trailing tab 2
  
  # a block for 3
  print (3);
  print (3); # code for the 3 function
  print (3); # we have trailing tab 3
  
  # a block for 7
  print (7);
  print (7); # code for the 7 function
  print (7); # we have trailing tab 7
  
}
# comments as usual are possible
### 
#  this function has a nice name
#  @Author me

sub test($$@)
{
  local ($scalar1,$scalar2,@array) = @_;
  print "called test()\n";
  print "scalar1 = $scalar1\n";
  print "scalar2 = $scalar2\n";
  print "array = @array\n";
  $a = "(..)";                                     # ##PURE##
}

sub another_function(\@$$@)
{
  print "this function is never called\n";
  #and here is a comment with	some	tabsepareted	fields
  #a2b;
  #c2d;
  a#b2
  c#d2
  foo(
    1,
    2,
    [
      3,
      4,
      {
        a => "b",
        c => "d"
      },
      ### 
      #  comments possible
      
      sub ($)
      {
        local ($txt) = @_;
        return ":$txt:";
      },
      5
    ]
  );
}

sub foo
{
  print "$_[2][2]{a}\n";
  print $_[2][3]("jubel");
}
main();
