# export PATH="/usr/local/bin/:$PATH" # have problem with macvim
# export PATH="/usr/bin/:/usr/sbin/:$PATH" # no need, already there!
export PATH=/opt/local/bin:/opt/local/sbin:$PATH # adding an appropriate PATH variable for use with MacPorts
export PATH=/opt/subversion/bin/:$PATH # added for use svn
export PATH=~/bin:$PATH # added for local use

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
    . /usr/local/git/contrib/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$'

