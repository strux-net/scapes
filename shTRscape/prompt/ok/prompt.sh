#!/bin/bash
#
# Autogenerated from sh_tru using prompt.shTR
# do not edit this file, look for prompt.shTR and change this
# or you may loose all your changes and probably choose the wrong method.
# goto http://www.strux.net to find more information.
#
if [ "$1" = "-version" ] ; then
  echo "Version :"
  echo "  prompt.shTR	4.0a"
  exit 0
fi
# based on prompt.shTR , version : 4.0a
#****************************************
# Copyright
#****************************************
# This file is in the public domain.
# Use it at your won risk.
# There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# 
# Author : Michael Naumann
# 
#****************************************
#****************************************
# README
#****************************************
# How to use prompt.sh
#   source this file from your .bashrc (rsp .zshrc) with
#     . ~/strux/prompt.sh
#   or copy it anywhere and source it like in
#     . /anywhere/prompt.sh
# What prompt.sh requires
#   prompt.sh works best with bash (version 2 or later).
#   Furthermore a decent terminal-program knowing the xterm color-codes is supposed to be running underneath the bash.
#   
#   Good candidates are
#       xterm
#       Eterm
#       linux console
#       putty
#       cygwin
#       screen
# What prompt.sh does
#   sets bash's and zsh's prompting capability to prompt as follows
#       user@host 3 /tmp 2/502 20:21:18 1 OK
#   where
#       user		username
#       host		hostname
#       3		the tty
#       /tmp		the current directory (PWD)
#       2		the number of this command
#       502		the number of commands in the history (not for zsh)
#       20:21:18	the current time
#       1		the number of background jobs
#       OK		the last command exited without error (else shows errorcode)
#       
#   The input-cursor starts on a line of it's own.
#   
#   The fields are colored according to some situations
#       user
#           red if user is root
#           green otherwise
#       host
#           blue normally
#           brown if $HOSTDISPLAY is set
#               This is good to distinguish local from other sessions.
#                 For local sessions HOSTDISPLAY is set to something like host:0.0, for
#                 ssh sessions or after a "su - username" HOSTDISPLAY is unset.
#       directory (PWD)
#           green normally
#           underlined green, if more directories are on the dir-stack
#           red, if PWD does not exist.
#       number of background jobs
#           white, if no background-jobs are present
#           blue, otherwise
#       error code
#           same color as before if no error
#           inverted red, if an error occurred
#           
#   Furthermore, it prevents you from exiting the shell with ^D if either
#       some background-jobs are still present, or
#       the directory-stack is not empty
#       
#****************************************
#****************************************
# get some suitable values for userstandout and normal
#****************************************
#     userstandout	color for the username
#     normal		switch back to white on black
# these values are overwritten later if you're lucky
#****************************************
if [ "$LOGNAME" = "root" -o "$USER" = "root" ] ; then
  userstandout=`tput rev 2>/dev/null`
else
  userstandout=`tput bold 2>/dev/null`
fi
normal=`tput rmso 2>/dev/null`
#****************************************
# Best prompt with bash 2 or better or zsh
#****************************************
if [ "$BASH_VERSINFO" -ge 2 -o "$ZSH_NAME" = "zsh" ] ; then
  #****************************************
  # xterm and it's clones know how to use colors
  #****************************************
  if [[ "$TERM" == *xterm* || "$TERM" = "Eterm"  || "$TERM" = "linux" || "$TERM" = "cygwin" || "$TERM" = "screen" ]] ; then
     normal=$'\e[0m'
     Inverse=$'\e[7m'
     White=$'\e[1;37m'
     Light_Gray=$'\e[0;37m'
     Gray=$'\e[1;30m'
     Black=$'\e[0;30m'
     Red=$'\e[0;31m'
     Light_Red=$'\e[1;31m'
     Green=$'\e[0;32m'
     Light_Green=$'\e[1;32m'
     Brown=$'\e[0;33m'
     Yellow=$'\e[1;33m'
     Blue=$'\e[0;34m'
     Light_Blue=$'\e[1;34m'
     Purple=$'\e[0;35m'
     Pink=$'\e[1;35m'
     Cyan=$'\e[0;36m'
     Light_Cyan=$'\e[1;36m'
     UL_White=$'\e[1;37m'
     UL_Light_Gray=$'\e[0;37m'
     UL_Gray=$'\e[1;30m'
     UL_Black=$'\e[4;30m'
     UL_Red=$'\e[4;31m'
     UL_Light_Red=$'\e[1;31m'
     UL_Green=$'\e[4;32m'
     UL_Light_Green=$'\e[1;32m'
     UL_Brown=$'\e[4;33m'
     UL_Yellow=$'\e[1;33m'
     UL_Blue=$'\e[4;34m'
     UL_Light_Blue=$'\e[1;34m'
     UL_Purple=$'\e[4;35m'
     UL_Pink=$'\e[1;35m'
     UL_Cyan=$'\e[4;36m'
     UL_Light_Cyan=$'\e[1;36m'
    I_Red=$Red$Inverse
    #****************************************
    # the color for the host depends on whether we're on localhost ore remote
    #****************************************
    # This fact is detected by the presence of $HOSTDISPLAY which is set on localhost and unset if we are here via ssh
    #****************************************
    if [ -z "$HOSTDISPLAY" ] ; then
      hoststandout=$Blue
    else
      hoststandout=$Brown
    fi
    #****************************************
    # the color for the user depends on whether it's root or not
    #****************************************
    if [ $UID = 0 ] ; then
      userstandout=$Red
    else
      userstandout=$Green
    fi
    #****************************************
    # now comes the prompt
    #****************************************
    if [ "$ZSH_NAME" = "zsh" ] ; then
      setopt promptsubst PROMPT_PERCENT
      PS1=$'%{$userstandout%}%n$Light_Gray@$hoststandout%m$Light_Gray %l \$(coldir_zsh)\%~$Light_Gray %! $Brown%*$Light_Gray %{$jobcount%}%j \$(errcode)%{$normal%}\n'
    else
      PS1="\[$userstandout\]\u$Light_Gray@$hoststandout\h$Light_Gray \l \$(coldir_bash)\w$Light_Gray \#/\! $Brown\t$Light_Gray \$(jobcount_bash)\j \$(errcode)\[$normal\]\n"
      #****************************************
      # set the checking for disabling ^D
      #****************************************
      PROMPT_COMMAND=job_test_bash
    fi
  else
    #****************************************
    # we have no xterm, so we must use conservative settings
    #****************************************
    PS1="\[$userstandout\]\u@\h(\l)[\w] - \#/\! \t \j \$(errcode)\[$normal\]\n"
  fi
else
  #****************************************
  # we have a too old or unsupported shell, we are conservative
  #****************************************
  USER=`id -un`
  TTY=$(basename `tty`)
  PS1='$userstandout$USER@\h($TTY)[\w] - \#/\! $?$normal\n'
fi
function coldir_zsh()
{
  local olderrcode=$?
  if [ ! -e "$PWD" ] ; then
    echo -e $I_Red
  elif [ -w "$PWD" ] ; then
    if [ $#dirstack -eq 0 ] ; then
      echo -e $Green
    else
      echo -e $UL_Green
    fi
  else
    if [ $#dirstack -eq 0 ] ; then
      echo -e $Red
    else
      echo -e $UL_Red
    fi
  fi
  return $olderrcode
}
function coldir_bash()
{
  local olderrcode=$?
  if [ ! -e "$PWD" ] ; then
    echo -e $I_Red
  elif [ -w "$PWD" ] ; then
    if [ ${#DIRSTACK[*]} -eq 1 ] ; then
      echo -e $Green
    else
      echo -e $UL_Green
    fi
  else
    if [ ${#DIRSTACK[*]} -eq 1 ] ; then
      echo -e $Red
    else
      echo -e $UL_Red
    fi
  fi
  return $olderrcode
}
function jobcount_zsh()
{
  if [ -n "$jobstates" ] ; then
    echo -e "$Blue"
  fi
}
function jobcount_bash()
{
  local olderrcode=$?
  if [ ! -z "`jobs -p`" ] ; then
    echo -e "$Blue"
  fi
  return $olderrcode
}
function errcode()
{
  local olderrcode=$?
  if [ $olderrcode = "0" ] ; then
    echo -n "OK"
  else
    echo -ne "$I_Red $olderrcode "
  fi
}
function job_test_bash()
{
  if [ -z "$(jobs -p)" -a ${#DIRSTACK[*]} -eq 1 ] ; then
    IGNOREEOF=0
  else
    IGNOREEOF=999999
  fi
}
#****************************************
# only for zsh  (bash will happily just do nothing with it)
#****************************************
#precmd() { [ $#jobtexts != 0 ] && jobcount=$Blue || jobcount="" ; }
function precmd()
{
  if [ $#jobtexts != 0 ] ; then
    jobcount=$Blue
  else
    jobcount=""
  fi
  if [ $#jobtexts != 0 -o $#dirstack -ne 0 ] ; then
    setopt ignore_eof
  else
    setopt no_ignore_eof
  fi
}
