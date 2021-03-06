# Play! framework completion 
# put this file in /etc/bash_completion.d/ or init it with ". <this_script>" in bash
# 
# Gaetan Renaudeau <gre@zenexity.fr>


### OPTIONS ###


# switch to on to enable play app search
playAppSearch="on" 

# search criteria for valid play app
playapp="app conf public"  


# play options
opts="auto-test build-module classpath clean eclipsify help id idealize install javadoc list-module modules netbeansify new new-module out pid precompile run restart secret status start stop test war";

### C O D E ###


# function _isPlayValidApp 
# return 1 if argument $1 is a valid play app directory, else return 0

function _isPlayValidApp {
  local OLDIFS
  OLDIFS=$IFS; # save old IFS to restore it before return.
  IFS=" ";
  if [ -d "$1" ]; then # $1 is a directory
    for subdir in $playapp; do # foreach criteria, check if is a directory
      if [ ! -d "$1/$subdir" ]; then
        IFS=$OLDIFS;
        return 0;
      fi
    done
  fi
  IFS=$OLDIFS;
  return 1;
}


_play() 
{
  local cur prev list argc
  COMPREPLY=()
  
  # variable shortcut
  argc=${COMP_CWORD}
  cur="${COMP_WORDS[argc]}"
  prev="${COMP_WORDS[argc-1]}"

  
  if [ $argc -eq 1 ] || ([ $argc -eq 2 ] && [ "$prev" == "help" ]) ; then

  ### AutoComplete play options ###
    COMPREPLY=( $(compgen -W "${opts}" -- $cur ) )

  else

    if ([ $argc -eq 2 ] && [ "$prev" != "new" ] && [ "$prev" != "new-module" ] && [ "$prev" != "build-module" ] && [ "$prev" != "list-module" ] && [ "$prev" != "id" ] && [ "$prev" != "install" ]);
    
    then
      
      if [ "$playAppSearch" == "on" ]; then

        # playAppSearch is ON 
        ### AutoComplete play app ###

        list=""
        IFS=$'\n';

        for f in $(find $cur* -maxdepth 2 -type d 2> /dev/null); do 
          _isPlayValidApp "$f";
          # if dir is a play app, add it in the list (and escape space in the path)
          if (($?==1)); then
            list="$list\""$(echo $f | sed 's/ /\\ /g')"\""$'\n'; 
          fi
        done
        
        COMPREPLY=( $(compgen -W "${list}" -- $cur ) )


      else

        # playAppSearch is OFF
        ### AutoComplete directory ###

        COMPREPLY=( $(compgen -d -- $cur ) )
        
      fi
      
    fi


  fi
}

complete -F _play play

