#!/bin/bash

set -e
set -x

packer build -var-file="variables.pkrvars.hcl" packer
