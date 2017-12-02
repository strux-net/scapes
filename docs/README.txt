the strux-tools
  programs/scripts/vim-plugins all based on tru or truers.

  find the latest version and more information on http://www.strux.net
  Things you find here
    vim plugins
          tabify.vim		vimTRscape/tabify			tabalign a visual region
          ApplyMarks.vim	vimTRscape/ApplyMarks			apply text-marks
          QuickView.vim		vimTRscape/QuickView			quick-view local settings
          LL.vim		vimTRscape/LL				A vim/perl based filebrowser with nice features
          session.vim		vimTRscape/session			maintain vim-sessions
          pstree.vim		vimTRscape/pstree			inspect the process-tree
          CycleSyn.vim		vimTRscape/CycleSyn			cycle through syntax-settings
          findShorterIndent.vim	vimTRscape/findShorterIndent		find the next/prev line with a shorter indent
          tref.vim		vimTRscape/tref				provide context view (indent related)
          ZoomFont.vim		vimTRscape/ZoomFont			(un-)zoom fontsize
          xterm.vim		vimTRscape/xterm			show the other screen
    shell-scripts
          L			shTRscape/LL				A vim/perl based filebrowser with nice features
          pst			shTRscape/pst				inspect the process-tree (needs vim)
          truerItem		shTRscape/truerItem			find lines that are matched by a specific item of a specific truer
          prompt.sh		shTRscape/prompt			An elaborated prompt for bash and/or zsh
    perl-scripts
          acmd			perlTRscape/acmd			execute commands depending on filename
          tabify		perlTRscape/tabify			tabalign text
          i			perlTRscape/i				indents or outdents a file by a given amount.
          ftrace		perlTRscape/ftrace			trace a process (and it's childs) and produces a tree-view summary.
          listVimSwapFiles	perlTRscape/listVimSwapFiles		parses output of `vim -r` and presents it compacted
          XPE.vim		perlTRscape/XPE				for LL.vim
    truers
          isel			truscape/isel				select lines of structured text
          ijoin			truscape/ijoin				join lines with their (indent-) parents.
          tru			truscape/tru				A parser-generator for structured text
          m_tru			truscape/m				produces a makefile based on the content of mTR
          trudoc_tru		truscape/trudoc				produces html-documentation for a truer
          tagcloser_tru		truscape/tagcloser			a simple filter to close html-tags
          html_tru		truscape/textproc/html			convert .txtTR to html
          tex_tru		truscape/textproc/tex			convert .txtTR to tex or pdf
          js_tru		truscape/proglang/js			convert .jsTR to .js
          sh_tru		truscape/proglang/sh			convert .shTR to .sh
          vim_tru		truscape/proglang/vim			convert .vimTR to .vim
          c_tru			truscape/proglang/c			convert .cTR to .c
          java_tru		truscape/proglang/java			convert .javaTR to .java
          perl_tru		truscape/proglang/perl			convert .plTR to .pl
          vimInterface2Help_tru	truscape/proglang/vim/vimInterface2Help	make documentation for the mappings and commands
  common to all listed directories
	each directory contains the files `mTR` and `makefile` as well as a `docs`-directory with at least a readme.
	the `makefile` is generated from `mTR` via `m_tru mTR > makefile`.
	  Hence the `makefile` is not really needed in git.

