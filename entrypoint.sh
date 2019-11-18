#!/bin/sh

# A simple self-contained script for executing commands within an "entered" set
# of namespaces.
# Avoids having to weird-encode everything passed to sh -c as a one liner.

# Get line number of inner script
inner=$(awk '/^# START/ {print NR}' $0)

# Enter the namespaces of the host &
# Execute the inner script
nsenter -t 1 -m -u -n -i -- sh -c "$(tail -n +$inner $0)"

# Pass the return code out
exit $?

# START OF INNER SCRIPT
script="$(grep -o "[^ ]*merged")/usr/local/bin/host.sh /etc/mtab"
exec $script
