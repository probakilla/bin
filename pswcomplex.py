#!/usr/bin/python3.7

import sys
import re

MEAN_CHAR_COUNT = 80
CALC_TIME = 1.7 * (10 ** -6)


class PassComplexity(object):
    def __init__(self, pswd):
        self.__pswd = pswd
        self.__char_count = 0
        print("Password composition:")
        self.__search_chars()
        print("")
        psw_len = len(pswd)
        nb_tries = self.__char_count ** psw_len
        self.__complexity = int(CALC_TIME * nb_tries)

    def __search_chars(self):
        self.__has_lower()
        self.__has_upper()
        self.__has_digits()
        self.__has_symbol()

    def __has_lower(self):
        regexp = re.compile(r'[a-z]')
        self.__print_type("Lower characters:")
        if regexp.search(self.__pswd):
            self.__char_count += 26
            print("YES")
        else:
            print("NO")

    def __has_upper(self):
        regexp = re.compile(r'[A-Z]')
        self.__print_type("Upper characters:")
        if regexp.search(self.__pswd):
            self.__char_count += 26
            print("YES")
        else:
            print("NO")

    def __has_digits(self):
        regexp = re.compile(r'\d')
        self.__print_type("Digits: ")
        if regexp.search(self.__pswd):
            self.__char_count += 10
            print("YES")
        else:
            print("NO")

    def __has_symbol(self):
        regexp = re.compile(r'\W')
        self.__print_type("Symbols: ")
        if regexp.search(self.__pswd):
            self.__char_count += 18
            print("YES")
        else:
            print("NO")
        
    def __print_type(self, char_type):
        msg = char_type.ljust(18, ' ')
        print('\t' + msg, end="")

    def seconds(self):
        return self.__complexity

    def hours(self):
        return int(self.__complexity / 60)

    def days(self):
        return int(self.hours() / 24)

    def years(self):
        return int(self.days() / 365)


def main(argv):
    if len(argv) - 1 < 1:
        print("Need one argument")
        exit(1)
    complexity = PassComplexity(argv[1])
    print("Complexity of password:")
    print(f"\t{complexity.seconds()} seconds.")
    print(f"\t{complexity.hours()} hours.")
    print(f"\t{complexity.days()} days.")
    print(f"\t{complexity.years()} years.")
    

if __name__ == "__main__":
    main(sys.argv)
