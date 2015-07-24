#! /bin/bash
cp webelexis/webelexis-server/target/webelexis-server-${VERSION}.jar .
java -jar webelexis-server-${VERSION}.jar cfglocal.json >webelexis.log
