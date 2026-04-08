import os

LOG_FILE = "/home/kali/app_backups/back.log"

if not os.path.exists(LOG_FILE):
    print("Log file not found")
    exit()

# Keywords that indicate problems
ERROR_KEYWORDS = [
        "error",
        "failed",
        "failure",
        "exception",
        "unable"
        "denied"
]

found = False

with open(LOG_FILE, "r") as f:
    for line in f:
        if any(k in line.lower() for k in ERROR_KEYWORDS):
            print(line.strip())
            found = True

if not found:
    print("No errors found")


