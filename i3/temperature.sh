#!/bin/bash
DATA="$(sensors | egrep '(Core 0|temp1)' | egrep -o '\+[0-9\. ]+' | head -2 | tr '\n' '/' )"
echo "${DATA%?} "
