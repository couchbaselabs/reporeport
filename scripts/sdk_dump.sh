#!/bin/sh

echo "" > sdk.conf
SUITES=$(find sdkdclient-ng/src/main/resources/suites -name '*json')
for suite in $SUITES 
do
	component=$(echo $suite | sed -e 's/.*\///' -e 's/.json//')
	grep "id" $suite | awk -F ':' '{print $2}' | sed -e 's/ *"//g' -e 's/,//' -e "s/^/$component:/"	 >> sdk.conf
done
