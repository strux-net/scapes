// These lines come from the intro
// This file is copyright by hunini
#ifdef __cplusplus
extern "C" {
#endif
#if	HAVE_CONFIG_H
#include <config.h>
#endif
int opt_a = 0;
int opt_b = 0;
const char *opt_f = "/tmp/schrott";
int opt_t = 0;
// based on ctest.ccTR , version : 3.0
#include <iostream.h>
#include "ctest.h"
using std::string;
using std::regex;
// based on ctest.ccTR , version : 3.0a
/**
 * emit a usage to stderr and exit with code 1
 */
void usage()
{
  std::cerr << "usage : ctest" << std::endl;
  std::cerr << "this program only serves as a test-suite" << std::endl;
  std::cerr << "it does *NOT* do anything use- or harmfull" << std::endl;
  std::cerr << "It simply shows the possibilities" << std::endl;
  std::cerr << " You can have any indent here" << std::endl;
  std::cerr << "  1" << std::endl;
  std::cerr << "       2" << std::endl;
  std::cerr << "      3" << std::endl;
  std::cerr << "     4" << std::endl;
  std::cerr << "	 6" << std::endl;
  std::cerr << "         6" << std::endl;
  std::cerr << "Tables look like this" << std::endl;
  std::cerr << "1	2" << std::endl;
  std::cerr << "11	22" << std::endl;
  std::cerr << "111	222" << std::endl;
  std::cerr << "1111	2222" << std::endl;
  std::cerr << "11111	22222" << std::endl;
  std::cerr << "111111	222222" << std::endl;
  std::cerr << "1111111	2222222" << std::endl;
  std::cerr << "" << std::endl;
  std::cerr << "OPTIONS:" << std::endl;
  std::cerr << "	-a	Option a" << std::endl;
  std::cerr << "		description for option a" << std::endl;
  std::cerr << "	-b	Option b" << std::endl;
  std::cerr << "	-f=file	file name" << std::endl;
  std::cerr << "		default for file is /tmp/schrott" << std::endl;
  std::cerr << "		description for option f" << std::endl;
  std::cerr << "	-t	Option t" << std::endl;
  std::cerr << "	-version	show version information" << std::endl;
  exit(1);
}
/* types */
typedef int INT;                                  /* for portability */
typedef char CHAR;
/** a silly comment */
#define	  a		1 + 2
/** a silly comment */
#define	  aa		1 + 2
/** a silly comment */
#define	  aaa		1 + 2
/** a silly comment */
#define	  aaaa		1 + 2
/** a silly comment */
#define	  aaaaa		1 + 2
/** a silly comment */
#define	  aaaaaa	1 + 2
/** a silly comment */
#define	  aaaaaaa	1 + 2
/** a silly comment */
#define	  aaaaaaaa	1 + 2
/** a silly comment */
#define	  aaaaaaaaa	1 + 2
/** a silly comment */
#define	  aaaaaaaaaa	1 + 2
/** a silly comment */
#define	  aaaaaaaaaaa	1 + 2
/** a silly comment */
#define	  aaaaaaaaaaaa	1 + 2
#define	  bbbbbbbbbbbb	1 + 2
#define	Long	(l,\
o,\
n,\
 g)\
  
#define	  Text	"running"
char *varwithtextacrossmultiplelines = "pure c-code can be produced
  as you can see here
  You could not write such a thing as statement, since a ; would
  be appended to each line
  and tabs	wouldn't be as expected
  No such thing happens in this mode
  Empty lines will survive

  And :
    leading spaces will survive relative to c code
    But :
      leading tabs will be converted to lots of spaces";

// vars
enum colours {
  red,
  green,
  blue,
};
/** Test statement */
int i=0;
// a comment in the var-section
int j[] = {
  1,
  2,
  3,
};

int main(int argc,char **argv)
{
  if (argc == 2 && argv[1][0] == '-' &&
                   argv[1][1] == 'v' &&
                   argv[1][2] == 'e' &&
                   argv[1][3] == 'r' &&
                   argv[1][4] == 's' &&
                   argv[1][5] == 'i' &&
                   argv[1][6] == 'o' &&
                   argv[1][7] == 'n' &&
                   argv[1][8] == '\0') {
    std::cout << "Version :\n";
    std::cout << "  ctest.ccTR\t3.0\n";
    std::cout << "  ctest.ccTR\t3.0a\n";
    return 0;
  }
  if (argc == 2 && argv[1][0] == '-' && argv[1][1] == '?' && argv[1][2] == '\0') {
    usage();
  }
  int a=17;                                        // a comment
  int b=0;
  char *c=0;
  cout << Text << endl;
  char optchar;
  while ((optchar=getopt(argc,argv,"tf:ba")) != EOF) { // Test Option
    // -a : Option a
    if (optchar == 'a') {
      opt_a++;
      a=1;
    }
    // -b : Option b
    if (optchar == 'b') {
      opt_b++;
      b=1;
      a=0;
    }
    // -f : file name
    if (optchar == 'f') {
      if (*optarg == '=') optarg++;
      opt_f = optarg;
    }
    // -t : Option t
    if (optchar == 't') {
      opt_t++;
      test(3,4);
    }
    if (optchar == '?') usage();
  }
  std::cout << "-a\t" << opt_a << endl;            // another comment
  std::cout << "-b\t" << opt_b << endl;
  std::cout << "-f\t" << opt_f << endl;
  std::cout << "-c\t" << opt_c << endl;
  std::cout << "-t\t" << opt_t << endl;
  cout << "optind is " << getopt.optind << endl;
#if	1
  if (!(1==1)) {
    cerr << "PANIC, PANIC, PANIC";
  } else {
    cout << "42";
  }
  if (0) {
  }
  if (1) {
    i=0;
  } else {
    i=1;
  }
  if (2) {
    i=2;
  } else if (b) {
    // Test if
    int k = 4;
    for (i=0;i<3;i++) {
      // Test for
      int j = i*i;
      cout << i << " : " << j << endl;
    }
    while (i--) {
      // Test while
      while (k--) {
        cout << k << endl;
      }
    }
    if (x1) {
      y(1);
    } else if (!(x2)) {
      y(2);
    } else {
      y(3);
    }
  } else {
    // Test else
    cout << "you did not give me a b" << endl;
  }
#endif
  a=0;
  do {
    cout << a++;
    if (a< 2) {
      cout << " smaller 2" << endl;
    } else if (a== 2) {
      cout << " equal 2" << endl;
    } else if (a> 2) {
      cout << " greater 2" << endl;
    } else {
      cout << " cannot occur" << endl;
    }
  } while (!(a>5));
  if (a== 6) {
    cout << a << " equal 6" << endl;
  }
  if (a>  5) {
    cout << a << " greater 5" << endl;
  }
  if (a<  2) {
    cout << a << " smaller 2" << endl;
  }
  xay
  1a2
    3a4
      5a6
    7a8a9
    // copied unchanged
    
  xby
  1b2
    3b4
      5b6
    7b8b9
    // copied unchanged
    
  xcy
  1c2
    3c4
      5c6
    7c8c9
    // copied unchanged
    
  xay
  a1a2
    3a4
    
  xby
  b1b2
    3b4
    
  xcy
  c1c2
    3c4
    
}
/**
*  a short description for function test.
*  A detailed description for test.
*  @param f a description for param f
*  @param g a description for param g
*  @return a description for the return value
*/

void test(int f, int g) interrupt INT19
{
  cout << "called test()" << endl;
  switch (f) {                                    /* Test switch */
    default :                                     /* Test default for switch */
    {
      cout << "internal" << endl;
      /* no break */
    }
    case 1 :
    case 2 :
    {
      if (wa) {
      } else {
        b;
      }
      break;
    }
    case 3 :                                      /* Test case for switch */
    {
      cout << "I feel good" << endl;
      switch (g) {
        case 'a' :
        {
          cout << "xingalf";
          /* no break */
        }
        case 'b' :
        {
          cout << "kringalf";
          break;
        }
      }
      break;
    }
    case 4 :
    {
      cout << "Me too" << endl;
      switch (f) {
        case 'a' :
        {
          cout << "knusel";
        }
        case 'b' :
        {
          cout << "wusel";
        }
        default :
        {
          cout << "drusel";
        }
      }
      break;
    }
  }
}

void nevercalled()
{
  //****************************************
  // this function is never called
  //****************************************
  // because none of these functions is ever called
  //****************************************
  while (1) {
    cerr << "kill me, kill me please" << endl;
  }
  while (1) {
    cerr << "I'm still alive, I wanna die" << endl;
  }
  for (int n : {0,1,2,3,4,5}) {
    std::cout << n << ' ';
  }
}
#ifdef __cplusplus
}
#endif
