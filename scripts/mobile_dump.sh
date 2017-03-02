#!/bin/sh
pytest mobile-testkit/testsuites/listener/shared/client_client --collect-only | sed "s/.*test/client:test/g" |  grep -v "\.py" | grep ".>" | sed  "s/'>//" > mobile.conf
pytest mobile-testkit/testsuites/listener/shared/client_sg --collect-only | sed "s/.*test/client:test/g" |  grep -v "\.py" | grep ".>" | sed  "s/'>//" >> mobile.conf
pytest mobile-testkit/testsuites/syncgateway/functional/tests --collect-only | grep Function | sed "s/.*'test/gateway:test/g" |  grep -v "\.py" | grep ".>" | sed  "s/'>//" >> mobile.conf
pytest mobile-testkit/testsuites/syncgateway/functional/topology_specific_tests --collect-only | sed "s/.*test/topology:test/g" |  grep -v "\.py" | grep ".>" | sed  "s/'>//" >> mobile.conf
