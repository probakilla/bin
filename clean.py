from os import remove

file_list = (".urls.txt", ".diff.txt")

for f in file_list:
    remove(f)