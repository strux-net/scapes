# Autogenerated makefile
# by :
#   m_tru mTR >makefile
#
m_diff=bash -c 'if ! diff -a -q $$1 ok/$$1 >/dev/null ; then echo -e "BAD\t$$1\tok/$$1" ; else echo -e "GOOD\t$$1" ; fi ; ' m_diff
m_copy=bash -c 'if ! diff -a -q $$1 $$2    >/dev/null ; then echo copying $$1 $$2; cp -p $$1 $$2 ; fi ; ' m_copy
ALL:\
  simple_goal\
  goal1\
  goal2\
  addr2nokia\

install install_ALL:\
  install_simple_goal\
  install_goal1\
  install_goal2\
  install_addr2nokia\

test test_ALL:\
  test_simple_goal\
  test_goal1\
  test_goal2\
  test_addr2nokia\

logged_build:
	-@${MAKE} --no-print-directory test_ALL 2>&1 | perl -pe 's,$$ENV{HOME}/,~/,g' >m.log # substitute /home/username with ~  (to avoid test-fails for trivial reasons)
	@${m_diff} m.log
confirmed_install: confirm install
confirm:
	@bash -c 'read -p "really install ? (^C) if not"'
export Title=this is a demo project
install_simple_goal:
	@echo  installing simple_goal
	@${m_copy} simple_goal ok/simple_goal
test_simple_goal: simple_goal
	@echo  testing simple_goal
.PHONY: simple_goal
simple_goal:
	@echo  building simple_goal
	perl_tru simple_goal.plTR >simple_goal
	@${m_diff} simple_goal
	chmod +x simple_goal
install_goal1:
	@echo  installing goal1
	@${m_copy} goal1 ok/goal1
	@${m_copy} statistics.out ok/statistics.out
	@${m_copy} outfile ok/outfile
	@${m_copy} generated_file ok/generated_file
	@${m_copy} docs/goal1-commands.txt ok/docs/goal1-commands.txt
	vim -u NONE -c 'helptags ~/.vim/doc' -c q
	@${m_copy} a $$HOME/
	@${m_copy} goal1 ~/bin/goal1
	@${m_copy} another file ok/another file
	@${m_copy} goal1 ~/strux/bin/goal1
test_goal1: goal1
	@echo  testing goal1
	command >outfile
	@${m_diff} outfile
	: a comment
	command w/o outfile
	@${m_diff} generated_file
	@${m_copy} a ok/
.PHONY: goal1
goal1:
	@echo  building goal1
	tru -s statistics.out goal1.tru >goal1
	@${m_diff} goal1
	@${m_diff} statistics.out
	chmod +x goal1
	Title="*goal1.txt*   this is a demo project" vimInterface2Help_tru goal1.vimTR >docs/goal1-commands.txt
	@${m_diff} docs/goal1-commands.txt
	echo "docs are ready"
install_goal2:
	@echo  installing goal2
	@${m_copy} goal2 ok/goal2
	@${m_copy} goal2 ~/bin/goal2
test_goal2: goal2
	@echo  testing goal2
.PHONY: goal2
goal2:
	@echo  building goal2
	command >goal2
	@${m_diff} goal2
install_addr2nokia:
	@echo  installing addr2nokia
	@${m_copy} addr2nokia ok/addr2nokia
	@${m_copy} statistics.out1 ok/statistics.out1
test_addr2nokia: addr2nokia
	@echo  testing addr2nokia
.PHONY: addr2nokia
addr2nokia:
	@echo  building addr2nokia
	tru -s statistics.out1 addr2nokia.tru ../addr_desc.tru >addr2nokia
	@${m_diff} addr2nokia
	@${m_diff} statistics.out1
	chmod +x addr2nokia
