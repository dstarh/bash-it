alias undopush="push -f origin HEAD^:master"
alias undocommit="git reset --soft HEAD^"
alias l.='ls -dl .*'
alias breset='. ~/.bash_profile'
alias gpod='git push origin develop'
alias gffc='git flow feature checkout'
alias nutrioCompile='cd /usr/local/nutrio/nutrio && bin/stage_compile.sh /usr/local/nutrio/nutrio'
alias nutrioToolsCompile='rm -rf /usr/local/nutrio/nutrio/webapps/tools; rm /usr/local/nutrio/nutrio/webapps/tools.war; cd /usr/local/nutrio/tools && grails war /usr/local/nutrio/nutrio/webapps/tools.war --stacktrace --verbose;say -v Zarvox "war is over"'
alias nutrioDebugCompile='cd /usr/local/nutrio/nutrio && bin/debug_compile.sh /usr/local/nutrio/nutrio'
alias tomcatStart='/usr/local/jakarta-tomcat-5.5.9/bin/catalina.sh jpda start; tail -f /usr/local/jakarta-tomcat-5.5.9/logs/catalina.out'
alias profileRuby='echo -e "\033]50;SetProfile=ruby\a"'
alias profileJava='echo -e "\033]50;SetProfile=java\a"'
