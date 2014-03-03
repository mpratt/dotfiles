#!/bin/bash
SONG=$(audtool current-song | sed 's/#//g;s/\"//g')
if [ -z "${SONG}" ]; then
    echo "Audacious not running"
else
    echo "$SONG"
fi
