#!/bin/sh

#Remove SUID from all GPFS executables t oavoid exposure to another CVE

chmod -s /usr/lpp/mmfs/bin/*
