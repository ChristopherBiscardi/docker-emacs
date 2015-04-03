<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. docker-emacs</a></li>
</ul>
</div>
</div>

# docker-emacs<a id="sec-1" name="sec-1"></a>

My Emacs and ZSH; Dockerized

I use the following script day-to-day to launch emacs with \`e\`. Note
that since I use git mainly, the script has different behavior for
when it is executed in git repos.

    e () {
        if [ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]
        then
            if [[ -n $1 && ( -a $1 || -d $1 ) ]]
            then
                FULLPATH=$1:A
                GITPATH=$(git rev-parse --show-toplevel)
                GIT_PATH_LENGTH=${#GITPATH}
                EDIT_FILE_PATH=$FULLPATH[$GIT_PATH_LENGTH+2,${#FULLPATH}]
                docker run -itv $(git rev-parse --show-toplevel):/files --rm biscarch/emacs emacs /files/$EDIT_FILE_PATH
            elif [[ -n $1 && ! -a $1 && ! -d $1 ]]
            then
                echo "Does not support creation of new files. Please touch first."
            else
                docker run -itv $(git rev-parse --show-toplevel):/files --rm biscarch/emacs emacs /files
            fi
        else
            if [[ -n $1 && ( -a $1 || -d $1 ) ]]
            then
                FULLPATH=$1:A
                THEPATH=`pwd`
                EDIT_FILE_PATH=$FULLPATH[${#THEPATH}+2,${#FULLPATH}]
                docker run -itv $THEPATH:/files --rm biscarch/emacs emacs /files/$EDIT_FILE_PATH
            elif [[ -n $1 && ! -a $1 && ! -d $1 ]]
            then
                RELATIVEPATH=$1
                THEPATH=`pwd`
                touch $RELATIVEPATH
                docker run -itv `pwd`:/files --rm biscarch/emacs emacs /files/$RELATIVEPATH
            else
                docker run -itv `pwd`:/files --rm biscarch/emacs emacs /files
            fi
        fi
    }

The README.md file in this repo is exported from README.org
