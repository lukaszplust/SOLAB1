#!/bin/bash

grep "OK DOWNLOAD" cdlinux.ftp.log | cut -d '"' -f 2,4 | sort -u | cut -d '"' -f 2 | grep "\.iso" | sed "s#.*/##" | sort > wyniki.txt
cat cdlinux.www.log | cut -d " " -f 1,7,9 | grep "200" | sort | uniq | sed "s#.*/##" | cut -d " " -f 1 | grep "\.iso" | sort >> wyniki.txt
cat wyniki.txt | sort | uniq -c