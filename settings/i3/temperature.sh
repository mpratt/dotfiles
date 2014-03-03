#!/bin/bash
echo "$(sensors | grep 'Core 0' | egrep -o '\+[0-9\.]+' | head -1)"
