#!/bin/bash

find . -type f -name '*~' -delete 2> /dev/null;
find . -type f -name '\#*' -delete 2> /dev/null;

echo " --- cleared ---";
