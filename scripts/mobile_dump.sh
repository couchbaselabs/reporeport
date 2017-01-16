pytest mobile-testkit/testsuites/listener/shared/client_client --collect-only | sed "s/.*test/client:test/g" |  grep -v "\.py" | grep ".>" | sed  "s/'>//" > mobile.conf
pytest mobile-testkit/testsuites/listener/shared/client_sg --collect-only | sed "s/.*test/gateway:test/g" |  grep -v "\.py" | grep ".>" | sed  "s/'>//" >> mobile.conf
