# Autogenerated makefile
# by :
#   m_tru mTR >makefile
#
m_diff=bash -c 'if ! diff -a -q $$1 ok/$$1 >/dev/null ; then echo -e "BAD\t$$1\tok/$$1" ; else echo -e "GOOD\t$$1" ; fi ; ' m_diff
m_copy=bash -c 'if ! diff -a -q $$1 $$2    >/dev/null ; then echo copying $$1 $$2; cp -p $$1 $$2 ; fi ; ' m_copy
ALL:\
  vim_tru\

install install_ALL:\
  install_vim_tru\

test test_ALL:\
  test_vim_tru\

logged_build:
	-@${MAKE} -B --no-print-directory ALL test_ALL 2>&1 | perl -pe 's,$$ENV{HOME}/,~/,g' >m.log # substitute /home/username with ~  (to avoid test-fails for trivial reasons)
	@${m_diff} m.log
confirmed_install: confirm install
confirm:
	@bash -c 'read -p "really install ? (^C) if not"'
export Title=convert .vimTR to .vim
install_vim_tru:
	@echo  installing vim_tru
	@${m_copy} statistics.out ok/statistics.out
	@${m_copy} vim_tru ok/vim_tru
	@${m_copy} test.vim ok/test.vim
	@${m_copy} test1.vim ok/test1.vim
	@${m_copy} docs/README.txt ok/docs/README.txt
	@${m_copy} docs/README.html ok/docs/README.html
	@${m_copy} docs/vim_tru.html ok/docs/vim_tru.html
	@${m_copy} vim_tru ~/strux/bin/vim_tru
test_vim_tru: vim_tru
	@echo  testing vim_tru
	./vim_tru test.vimTR >test.vim
	@${m_diff} test.vim
	./vim_tru test.vimTR >test1.vim
	@${m_diff} test1.vim
	-./vim_tru -invalid
vim_tru:
	@echo  building vim_tru
	tru -s statistics.out ../common.tru ../morecommon.tru ../plainvar.tru vim.tru vimcoll.tru  ../../lib/basicUSAGE.tru >vim_tru
	chmod +x vim_tru # this is needed for trudocGivesCheck, else it finds the truer somewhere else
	PATH=$$PWD:$$PATH perl ~/bin/trudocGivesCheck -s vim vim_tru >vim_tru.tmp
	mv vim_tru.tmp vim_tru
	chmod +x vim_tru
	@${m_diff} statistics.out
	@${m_diff} vim_tru
	{ echo "vim_tru\n  convert .vimTR to .vim\n    usage"; ./vim_tru -? 2>&1 | i -it 1 ; } >docs/README.txt
	@${m_diff} docs/README.txt
	{ sed "s/^    usage$$/    code/" docs/README.txt ; echo "style\n  Title\tconvert .vimTR to .vim" ; } | html_tru >docs/README.html
	@${m_diff} docs/README.html
	trudoc_tru ./vim_tru >docs/vim_tru.html
	@${m_diff} docs/vim_tru.html
