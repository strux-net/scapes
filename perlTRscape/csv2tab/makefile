# Autogenerated makefile
# by :
#   m_tru mTR >makefile
#
m_diff=bash -c 'if ! diff -a -q $$1 ok/$$1 >/dev/null ; then echo -e "BAD\t$$1\tok/$$1" ; else echo -e "GOOD\t$$1" ; fi ; ' m_diff
m_copy=bash -c 'if ! diff -a -q $$1 $$2    >/dev/null ; then echo copying $$1 $$2; cp -p $$1 $$2 ; fi ; ' m_copy
ALL:\
  csv2tab\

install install_ALL:\
  install_csv2tab\

test test_ALL:\
  test_csv2tab\

logged_build:
	-@${MAKE} -B --no-print-directory ALL test_ALL 2>&1 | perl -pe 's,$$ENV{HOME}/,~/,g' >m.log # substitute /home/username with ~  (to avoid test-fails for trivial reasons)
	@${m_diff} m.log
confirmed_install: confirm install
confirm:
	@bash -c 'read -p "really install ? (^C) if not"'
export Title=convert csv for tru
install_csv2tab:
	@echo  installing csv2tab
	@${m_copy} csv2tab ok/csv2tab
	@${m_copy} docs/README.txt ok/docs/README.txt
	@${m_copy} docs/README.html ok/docs/README.html
	@${m_copy} csv2tab ~/strux/bin/csv2tab
	
test_csv2tab: csv2tab
	@echo  testing csv2tab
	./csv2tab      in
	./csv2tab -d , in
csv2tab:
	@echo  building csv2tab
	perl_tru csv2tab.plTR >csv2tab
	@${m_diff} csv2tab
	chmod +x csv2tab
	{ echo "csv2tab\n  $$Title\n    usage"; ./csv2tab -? 2>&1 | i -it 1 ; } >docs/README.txt
	@${m_diff} docs/README.txt
	{ sed "s/^    usage$$/    code/" docs/README.txt ; echo "style\\n  Title\\t$$Title" ; } | html_tru >docs/README.html
	@${m_diff} docs/README.html
