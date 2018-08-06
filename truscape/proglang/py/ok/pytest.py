import argparse
  # tbd
# based on pytest.pyTR , version : 3.0
# for (i=1;i<4;i=i+1)
i=1
while True:
  if not(i<4):
    break
  print('i inside loop : ',i)
  s=1
  i=i+1
print('i after loop : ',i)
list=[1,2,3]
for j in list:
  print('j inside loop : ',j)
  s=2
print('j after loop : ',j)
a=3+\
  4 -\
    4-\
     5\

released = {
  "iphone" : 2007,
  "iphone 3G" : 2008,
  "iphone 3GS" : 2009,
  "iphone 4" : 2010,
  "iphone 4S" : 2011,
  "iphone 5" : 2012,
  "tu" : (
    1,
    2
  )
}
print(released)
#
# emit a usage to stderr and exit with code 1
#
def usage():
  print("""\
usage : demo file
describing the usage
OPTIONS:
	-a	output all
		more info for option a
	-b	output binary
  	-f:file["/tmp/x"]	infile
  	-t:number[8]	how many spaces are a tab
  """)
if not (1==0):
  print("unequal")
def divide(x, y):
  """
    simple example from the python docu
  """
  try:
    result = x / y
  except ZeroDivisionError:
    print("division by zero!")
  else:
    print('result is', result)
  finally:
    print("executing finally clause")
def foo(x):
  """
    this is the jdocu for foo
      followed by even more description, a blank line
      
      and more description
  """
  print(a)
  print(x)
  print(c)
def bar(x,y):
  return x+y
divide(3,2)
a=3                                                # size
b=4                                                # age
c=[
  1,
  "zwei",
  2+.5,
  (
    bar(
      10,
      20
    ),
    3,
    4,
    [(
      5,
      7
    )]
  )
]
foo(2)
parser = argparse.ArgumentParser()
parser.add_argument('____argv', nargs='*') # always allow for any number of non-option arguments
parser.add_argument("-a",action='store_true',help="output all")
parser.add_argument("-b",action='store_true',help="output binary")
# infile
parser.add_argument("-f",default="/tmp/x",help="infile")
# how many spaces are a tab
parser.add_argument("-t",default=8,help="how many spaces are a tab",type=int)
opt = parser.parse_args()
argv=opt.____argv
if opt.a:
  print("option -a given")
  print("lucky you")
  pass
if opt.b:
  pass
if opt.f != "/tmp/x":
  print("file is now ",opt.f)
  #"file is %s\n", opt_f
  pass
if opt.t != 8:
  print("tabs set to ",opt.t)
  pass
print("-a : ",opt.a)
print("-f : ",opt.f)
print("-t : ",opt.t)
print("argv : ",argv)
print("a:"+str(opt.a))                             # a comment
print("a:"+str(opt.a))                             # a comment
print("b:"+str(opt.b))
while True:
  print("a:",a)
  for i in range(1,4):
    if i&1:
      print(""+str(i))
    else:
      print("   "+str(i))
  break
i=0
while True:
  print(""+str(i))
  i+=1
  if i==3:
    break
i=2
pytruS1=i
while True:
  if pytruS1 == 1:
    print("one")
    break
  if pytruS1 == 2:
    print("two")
    break
  if pytruS1 == 3:
    print("three")
    break
  print("default")
  break
class Pieces :
  King = 0
  Rook = 1
  Bishop = 2
print(Pieces.King)
usage()
class Board:
  def __init__(self):
    pass
  def coll(self):
    pass
class Chesspoard(Board):
  a=[
    1,
    2
  ]
  pass
