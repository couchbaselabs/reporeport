#!/bin/sh
grep "def test_" pydcp/unit.py  | sed -e 's/.*test/dcp:test'/  -e 's/(.*//' > pydcp.conf
