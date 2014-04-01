#!/usr/bin/env bash

# Download the latest version of an artifact available in a repository (by its ga[v]r)
FIND_GROUPID=acn.b.gmelabs
FIND_ARTIFACTID=testweb
FIND_REPOSITORYID=snapshots

FIND_PATH=`curl -X GET -u admin:admin123 -H "Accept: application/xml" "http://10.192.104.12:8081/nexus/service/local/artifact/maven/resolve?g=${FIND_GROUPID}&a=${FIND_ARTIFACTID}&v=LATEST&r=${FIND_REPOSITORYID}" 2>/dev/null | gawk -F'[<>]' '/\<repositoryPath\>/{ print $3 }'`
cd /var/lib/tomcat6/webapps && wget "http://10.192.104.12:8081/nexus/service/local/repositories/${FIND_REPOSITORYID}/content/${FIND_PATH}" 2>/dev/null
