#!/bin/bash

set -e
set -x

cd packer
packer build -var-file="variables.pkrvars.hcl" .
