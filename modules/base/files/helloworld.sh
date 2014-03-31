#!/usr/bin/env bash

# Download the latest version of an artifact available in a repository (by its ga[v]r)
FIND_GROUPID=acn.bbva.gmelabs
FIND_ARTIFACTID=test
FIND_REPOSITORYID=snapshots 

FIND_PATH=`curl -X GET -u admin:admin123 -H "Accept: application/xml" "http://localhost:8081/nexus/service/local/artifact/maven/resolve?g=${FIND_GROUPID}&a=${FIND_ARTIFACTID}&v=LATEST&r=${FIND_REPOSITORYID} <http://localhost:8081/nexus/service/local/artifact/maven/resolve?g=%24%7bFIND_GROUPID%7d&a=%24%7bFIND_ARTIFACTID%7d&v=LATEST&r=%24%7bFIND_REPOSITORYID%7d> " 2>/dev/null | gawk -F'[<>]' '/\<repositoryPath\>/{ print $3 }'`
wget "http://localhost:8081/nexus/service/local/repositories/${FIND_REPOSITORYID}/content/${FIND_PATH} <http://localhost:8081/nexus/service/local/repositories/%24%7bFIND_REPOSITORYID%7d/content/%24%7bFIND_PATH%7d> " 2>/dev/null
