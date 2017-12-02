listVimSwapFiles
  as a perlscript
    code
	usage : listVimSwapFiles

	parses output of `vim -r` and presents it compacted 

	the output could look like
	  %home%naumann%scapes%perlTRscape%listVimSwapFiles%listVimSwapFiles.swp           YES     10484   runnning        ~naumann/scapes/perlTRscape/listVimSwapFiles/listVimSwapFiles
	  %home%naumann%signature.swp                                                      YES     17423   dead            ~naumann/signature
	  %home%naumann%scapes%perlTRscape%listVimSwapFiles%listVimSwapFiles.plTR.swp      NO      10484   runnning        ~naumann/scapes/perlTRscape/listVimSwapFiles/listVimSwapFiles.plTR
	The fields meaning
	  swapfilename
	  modification status
	  pid of vim
	  status of vim
	  filename in vim
	Note:
	  status "running" is also printed if vim is in the background

	  -version	show version information
  as a vim-plugin
    code
        this is only useful together with LL.
        copy this file to ~/vim/plugin.

        usage:
          Assuming you have
            :set directory=/vimswp//
          then an entry in ~/LL.dirsettings could look like:
            /vimswp$
              P	%:%T%x
              Xi	P fillSWP()
              Xf	P return getSWPinfo($d,$F)

          start LL and see the result
            LL /vimswp

