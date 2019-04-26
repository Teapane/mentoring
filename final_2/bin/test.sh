#!/bin/bash

set -e

for file in test/*.rb; do ruby $file; done
