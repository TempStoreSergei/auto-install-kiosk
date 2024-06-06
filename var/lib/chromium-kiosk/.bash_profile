# ~/.bash_profile
#

# Check if ~/.bashrc exists and source it
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Automatically start X server on VT1 if not already running
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
   exec startx >& /dev/null
fi
