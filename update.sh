#!/usr/bin/env bash

# set-x

if [ $# -ne 1 ]; then
    echo "Usage: $0 <jlink.tar.gz>"
    echo "download J-Link Software and Documentation Pack Linux TGZ Archive from https://www.segger.com/downloads/jlink/"
    exit 1
fi

jlink_archive="$1"

if [ ! -f "$jlink_archive" ]; then
    echo "Error: $jlink_archive does not exist."
    exit 1
fi

rtt_archive_path=$(tar -tzf "$jlink_archive" | grep -E 'RTT.*\.tgz$')

if [ -z "$rtt_archive_path" ]; then
    echo "Error: RTT*.tgz not found"
    exit 1
fi

count=$(awk -F'/' '{print NF-1}' <<< "$rtt_archive_path")

tar --strip-components="$count" -xzf "$jlink_archive" "$rtt_archive_path"

rtt_archive=$(basename "$rtt_archive_path")

if [ ! -f "$rtt_archive" ]; then
    echo "Error: $rtt_archive extraction failed."
    exit 1
fi

tar --strip-components=1 -xzf "$rtt_archive"

rm -f "$rtt_archive"
