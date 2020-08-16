#!/bin/sh

# Post any BERT-loged hardware error to config

curl -k -X POST https://configuration.cx1.hpc.ic.ac.uk/bert/ -F "error=$(dmesg -T | grep  Hardware\ Error)"

