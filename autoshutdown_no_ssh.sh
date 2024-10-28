#!/bin/sh

# Set the maximum time to wait for an SSH connection (in seconds)
MAX_WAIT_TIME=$((15 * 60))

# Time interval between checks (in seconds)
INTERVAL=60

while true; do
    # Initialize the timer
    timer=0

    while [ "$timer" -lt "$MAX_WAIT_TIME" ]; do
        # Check if there are any active SSH sessions
        ssh_sessions=$(ss -t state established '( dport = :ssh or sport = :ssh )' | grep -c -E 'ssh')

        # If there's an active SSH session, reset the timer
        if [ "$ssh_sessions" -gt "0" ]; then
            timer=0
        else
            # Increment the timer by the interval
            timer=$((timer + INTERVAL))
        fi

        # Wait for the interval before checking again
        sleep $INTERVAL
    done

    # If the timer has reached the maximum wait time, shut down the server
    shutdown -h now
    exit 0
done
