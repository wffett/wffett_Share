alias ls='ls --color'
alias ll='ls -al --color'

function get_git_branchname() 
{
	local dir=.
	until [ "$dir" -ef / ]
	do
		if [ -f "$dir/.git/HEAD" ]; then
			git_branchname=$(git symbolic-ref --short -q HEAD 2>/dev/null)
			git_branchname=" ("$git_branchname")"
			return
		else
			dir="../$dir"
		fi
	done
	git_branchname=""
}
PROMPT_COMMAND="get_git_branchname;$PROMPT_COMMAND"

PS1='\[\e[32;1m\]\u@\h \[\e[34;40m\][\w\[\e[36;1m\]$git_branchname\[\e[34;40m\]] \[\e[0m\]\$: '
