#!/bin/sh

# A simple self-contained script for executing commands within an "entered" set
# of namespaces.
# Avoids having to weird-encode everything passed to sh -c as a one liner.

# Find the mount point for the current container
script="$(grep -o "[^=]*diff" /etc/mtab|sed "s/diff/merged/")/usr/local/bin/host.sh"

# Enter the namespaces of the host & execute the script
nsenter -t 1 -m -u -n -i -- sh -c $script

# Pass the return code out
exit $?
