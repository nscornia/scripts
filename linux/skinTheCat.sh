#! /bin/bash

#*
#* Kills all tomcat instances and clears deloys and logs
#*

echo
echo -e "***** Stopping Tomcat *****"

output="$(sudo service tomcat stop 2>&1)"
ps -ef | grep tomcat | awk '{print $2}' | xargs kill

if [[ $output =~ .*SEVERE.* ]]; then
    echo
    echo "${output}" | grep SEVERE
    echo
fi

echo -e "***** Removing deployed WARs and logs *****"
echo
rm -rf $HOME/Programs/apache-tomcat/work/Catalina/localhost/*
rm -rf $HOME/Programs/apache-tomcat/conf/Catalina/localhost/*
rm -rf $HOME/Programs/apache-tomcat/logs/*
