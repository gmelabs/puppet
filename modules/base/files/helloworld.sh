#!/usr/bin/env bash

#########################################################################################
# Deploys last version of 'Hello World' application from Nexus Server.
#########################################################################################

# Find the latest version of an artifact available in a repository (by its ga[v]r and type)
FIND_GROUPID=acn.b.gmelabs
FIND_ARTIFACTID=testweb
FIND_REPOSITORYID=snapshots
FIND_FILETYPE=war

FIND_PATH=`curl -X GET -u admin:admin123 -H "Accept: application/xml" "http://10.192.104.12:8081/nexus/service/local/artifact/maven/resolve?g=${FIND_GROUPID}&a=${FIND_ARTIFACTID}&v=LATEST&r=${FIND_REPOSITORYID}&p=${FIND_FILETYPE}" 2>/dev/null | gawk -F'[<>]' '/\<repositoryPath\>/{ print $3 }'`

# Download it to the Tomcat Webapps directory
cd /var/lib/tomcat6/webapps && wget -O testweb.war "http://10.192.104.12:8081/nexus/service/local/repositories/${FIND_REPOSITORYID}/content/${FIND_PATH}" 2>/dev/null

# Put a file indicating the SNAPSHOT version deployed in Tomcat
ARTIFACT_NAME=${FIND_PATH%%*/}
ARTIFACT_NAME=${ARTIFACT_NAME%.*}
echo ${ARTIFACT_NAME} > /tmp/deployed_helloworld_version
