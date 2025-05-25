#!/usr/bin/bash

# finds get and post endpoints in all java projects
. ./.env # sets RULES=..
cd ~/work
find .													\
		 -name node_modules -prune	\
		 -o -name pom.xml						\
		| grep pom.xml							\
		| parallel "cd {//}
 echo -n ====== && pwd
 semgrep -f $RULES --emacs 2>/dev/null \
|sed \"/java:/s|^|{//}/| \" " 
