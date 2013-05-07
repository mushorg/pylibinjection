import sys

import pylibinjection


if __name__ == "__main__":
    input_data = sys.argv[1]
    res = pylibinjection.detect_sqli(input_data)
    if res:
        print res
    else:
        print "NOEZ!"