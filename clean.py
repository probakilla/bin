#!/usr/bin/python3.7
"""
Clean the whole current directory
"""
from os import remove

FILE_LIST = (".urls.txt", ".diff.txt")

for f in FILE_LIST:
    remove(f)
