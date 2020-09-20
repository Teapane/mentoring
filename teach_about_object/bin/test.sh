#!/bin/bash
#fail all the things
set -e
#loops through each file in test directory and runs specs.
for file in test/*.rb; do ruby $file; done
