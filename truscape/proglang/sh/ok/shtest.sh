#!/bin/bash
#
# Autogenerated from sh_tru using shtest.shTR
# do not edit this file, look for shtest.shTR and change this
# or you may loose all your changes and probably choose the wrong method.
# goto http://www.strux.net to find more information.
#
opt_a=0
opt_f='/tmp/schrott'
opt_c=0
if [ "$1" = "-version" ] ; then
  echo "Version :"
  echo "  shtest.shTR	3.0"
  echo "  shtest.shTR	3.0a"
  exit 0
fi
# based on shtest.shTR , version : 3.0
## Hand written stuff	1
varwithtextacrossmultiplelines="pure sh-code can be produced\
  as you can see here"

## Resuming generated code
# based on shtest.shTR , version : 3.0a
# vars
i=0;                                               # Test statement
b=0;
w=(                                                # what
  one                                              # eins
  two                                              # zwei
)

usage()
{
  cat <<'EOU' >&2
usage : shtest arg
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

OPTIONS:
  -a	all messages
        more text for options a
  -f:<file>	output to file
	default for <file> is /tmp/schrott
        more text for options f
  -c	clear screen
  -version	show version information
EOU
  exit 1
}
### 
#  the main function
main()
{
  if [ $# -eq 1 -a "$1" = '-?' ] ; then
    usage
  fi
    while :;do
    echo "a'b"
      shtru_errcode=$?
      if [ $shtru_errcode -ne 0 ]; then
        while :;do
          read -n 1 -p "A(bort) R(etry) I(gnore) M(ore Info) C(ommand) " <&1
          echo >/dev/tty
          case $REPLY in
            [aA])	exit;;
            [rR])	break;;
            [iI])	break 2;;
            [mM])
              echo 'statement   : echo "a'"'"'b"'        >&2
              echo "current dir : $PWD"             >&2
              echo "Error code  : $shtru_errcode"    >&2
              echo "script-name : $0"               >&2
              echo "pid         : $$"              >&2
              echo "function    : $FUNCNAME"        >&2
              echo "linenr      : $[ $LINENO-17 ]" >&2
              ;;
            [cC])
              read -p "statement : " <&1
              eval $REPLY
              ;;
          esac
        done
      else
        break
      fi
    done
  for i in $w ; do
    echo "$i"
  done
  i=1
  shtruS1=$i
  while : ; do
    if [ "$shtruS1" == 1 ]; then
      echo "one"
      break
    fi
    if [ "$shtruS1" == 2 ]; then
      echo "two"
      break
    fi
    echo "something else"
    break
  done
  b=0
  echo "Running"
  while getopts 'c f: a' opt ; do 
    # Checking the options
    # -a : all messages
    if [ "$opt" = 'a' ] ; then
      (( opt_a++ ))
      echo "You have to note:"
      echo "Option a given"
    fi
    # -f : output to file
    if [ "$opt" = 'f' ] ; then
      opt_f="${OPTARG#*=}"
      echo "Option f given $opt_f"
    fi
    # -c : clear screen
    if [ "$opt" = 'c' ] ; then
      (( opt_c++ ))
    fi
    [ "$opt" = "?" ] && usage
  done # Checking the options
  shift $((OPTIND-1))
  [ "$1" = "--" ] && shift
  echo "opt_a = $opt_a"
  echo "opt_f = $opt_f"
  echo "opt_c = $opt_c"
  echo "remaining args = $*"
  if ! [ -z $opt_f ] ; then
    echo "muchas gracias por el f que es $opt_f"
  fi
  if [ -z $opt_a ] ; then
    echo "You did not give me option a"
  else
    echo "You gave me option a, I'm so lucky"
  fi
  echo "Now comes a string with a # in it"         # Do comments work ?
  test
  function_with_args 3
  function_with_args 4 5
  if [ "1" = "1" ] ; then
    echo "yes"
  else
    echo "no"
  fi
  if ! [ "2" = "2" ] ; then
    echo "yes"
  else
    echo "no"
  fi
  for (( i=0;i < 10;i++ )) ; do
    echo "$i"
    if [ $i -eq 5 ] ; then
      continue
    fi
    echo ".."
  done
  Ftest 3
  Ftest 4
  # a complicated statement
  # arg1 : comment
  # arg2 : an empty line follows
  # server, : lucky
  echo arg1 arg2 arg3 -monitor unix:/big/bill/nBill1/nBill1.cnsl,server,nowait
  : a_b=c;
  : a_#d=e;
  : a_#d=e;
  : a_#d=e;
}
Ftest()
{
  local limit=$1
  for (( i=1;i < limit;i=i+1 )) ; do
    echo "$limit : $i"
  done
}
test()
{
  echo "called test()"
  a=5
  while let a=a-1 ; do
    echo "$a"
  done
  a=5
  while [ $[ a = a-1 ] -ne 0 ] ; do
    if ! [ $a -ne 4 ] ; then
      echo "a is four"
    elif [ $a -eq 3 ] ; then
      echo "a is three"
    elif [ $a -eq 2 ] ; then
      echo "a is two"
    else
      echo "a is $a"
    fi
    echo "$a"
  done
  a=3
  until [ $a -eq 0 ];do
    echo "$a"
    : $[ a = a-1 ]
  done
  for i in one two three ; do
    echo "$i"
    if [ "$i" == "one" ] ; then
      echo "eins"
    elif [ "$i" == "two" ] ; then
      echo "zwei"
    elif [ "$i" == "three" ] ; then
      echo "drei"
    else
      echo "anything else"
    fi
  done
  for i in ONE TWO THREE ; do
    echo "$i"
  done
}
another_function()
{
  echo "this function is never called"
}
function_with_args()
{
  local a=$1
  local b=$2
  echo "a = $a"
  echo "b = $b"
}
function_demonstrating_blocks_and_continuationLines()
{
  {
    cd /tmp
    ls \
      a \
      b
  }
}
function_demonstrating_backgrounded_commands()
{
  #****************************************
  # they must not be terminated with a ";"
  #****************************************
  # since "&;" this leads to
  #   syntax error near unexpected token `;'
  #****************************************
  anycmd &
}
function_demonstrating_TAB()
{
  print 'Here a poem:';
  print '';
  print '            this line';
  print '          and this line';
  print '      are here by intention';
  print '     and are my own invention';
  alpha
    echo 'one	eins'
    echo 'two	zwei'
  omega
}
function_with_a_try()
{
  echo "block will not produce output"
  try
      ls
    e123
      "error"
    finally
      "finally"
}
main "$@"
