#!/bin/bash
/usr/sbin/apache2ctl -S 2>&1 | perl -ne 'm@.*port\s+([0-9]+)\s+\w+\s+(\S+)\s+\((.+):.*@ && do { print "$2:$1\n\t$3\n"; $root = qx{grep DocumentRoot $3}; $root =~ s/^\s+//; print "\t$root\n" };'
echo "Alternative : /usr/sbin/apache2ctl -S"

