function fish_prompt
    prompt:user
    prompt:path
    prompt:git
    echo -n ' → '
end

function prompt:user
    if test "$LOGNAME" != "$USER" -o "$UID" = 0
        set_color red
        echo -n $USER
        set_color normal
        echo -n ' in '
    end    
end

function prompt:path
    set -l path
	set -l repository (command git rev-parse --show-toplevel 2>/dev/null)
	if test -n "$repository"
		set path (string replace $repository (basename $repository) $PWD)
	else
		set -l realhome ~
		set path (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
    end
    set_color blue
    echo -n $path
    set_color normal
end

function prompt:git
    set -l branch (command git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if test -n "$branch"
        echo -n ' on '
        set_color green
        echo -n $branch
        if git:staged
            set_color yellow
            echo -n ' ≡'
            set_color normal
        end
        if git:dirty
            set_color red
            echo -n ' ⨯'
            set_color normal
        end
        set_color normal
    end
end

function git:repository
    command git rev-parse --show-toplevel 2>/dev/null
end

function git:dirty
    not command git diff --no-ext-diff --quiet --exit-code 2>/dev/null
end

function git:staged
    not command git diff --cached --no-ext-diff --quiet --exit-code 2>/dev/null
end

function git:untracked
    command git ls-files --other --exclude-standard 2>/dev/null
end
