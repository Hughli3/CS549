#!/bin/bash
export JARFILE=/Users/hughli/tmp/cs549/ftp-test/ftpd.jar
export POLICY=/Users/hughli/tmp/cs549/ftp-test/server.policy
export CODEBASE=file:/Users/hughli/tmp/cs549/ftp-test/ftpd.jar
export SERVERHOST=localhost

if [ ! -e $JARFILE ] ; then
	echo "Missing jar file: $JARFILE"
	echo "Please assemble the ftpserver jar file."
	exit
fi

if [ ! -e $POLICY ] ; then
	pushd /Users/hughli/tmp/cs549/ftp-test
	jar xf "$JARFILE" server.policy
	popd
fi

echo "java -Djava.security.policy=$POLICY -Djava.rmi.server.codebase=$CODEBASE -Djva.rmi.server.hostname=$SERVERHOST -jar $JARFILE $*"
java -Djava.security.policy=$POLICY -Djava.rmi.server.codebase=$CODEBASE -Djava.rmi.server.hostname=$SERVERHOST -jar $JARFILE $*
# mvn exec:java -Dexec.mainClass="edu.stevens.cs.cs549.ftpserver.ServerMain" -Djava.security.policy=$POLICY -Djava.rmi.server.codebase=$CODEBASE