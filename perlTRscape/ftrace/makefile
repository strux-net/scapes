# Autogenerated makefile
# by :
#   m_tru mTR >makefile
#
m_diff=bash -c 'if ! diff -a -q $$1 ok/$$1 >/dev/null ; then echo -e "BAD\t$$1\tok/$$1" ; else echo -e "GOOD\t$$1" ; fi ; ' m_diff
m_copy=bash -c 'if ! diff -a -q $$1 $$2    >/dev/null ; then echo copying $$1 $$2; cp -p $$1 $$2 ; fi ; ' m_copy
ALL:\
  ftrace\

install install_ALL:\
  install_ftrace\

test test_ALL:\
  test_ftrace\

logged_build:
	-@${MAKE} -B --no-print-directory ALL test_ALL 2>&1 | perl -pe 's,$$ENV{HOME}/,~/,g' >m.log # substitute /home/username with ~  (to avoid test-fails for trivial reasons)
	@${m_diff} m.log
confirmed_install: confirm install
confirm:
	@bash -c 'read -p "really install ? (^C) if not"'
export Title=trace a process (and it's childs) and produces a tree-view summary.
install_ftrace:
	@echo  installing ftrace
	@${m_copy} ftrace ok/ftrace
	@${m_copy} docs/README.txt ok/docs/README.txt
	@${m_copy} docs/README.html ok/docs/README.html
	@${m_copy} ftrace ~/strux/bin/ftrace
	@${m_copy} ftrace.vim ~/.vim/syntax/
test_ftrace: ftrace
	@echo  testing ftrace
	umask 0022; ./ftrace -v -q -s bash ./test.sh | sed -e 's/ran .* sec/ran any sec/' -e 's/symlinked from.*/hidden_for_m.log/'
	./ftrace    -q -o ft ls ftrace.plTR a.rc
	-./ftrace -invalid
	sed 's/ran .* sec/ran any sec/' < ft
	rm ft
ftrace:
	@echo  building ftrace
	perl_tru ftrace.plTR >ftrace
	@${m_diff} ftrace
	chmod +x ftrace
	{ echo "ftrace\n  $$Title\n    usage"; ./ftrace -? 2>&1 | i -it 1 ; } >docs/README.txt
	@${m_diff} docs/README.txt
	{ sed "s/^    usage$$/    code/" docs/README.txt ; echo "style\\n  Title\\t$$Title" ; } | html_tru >docs/README.html
	@${m_diff} docs/README.html
