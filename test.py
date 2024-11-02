#!/usr/bin/env python3
import json
from datetime import datetime


def log(level: str, message: str):
    timestamp = datetime.now().strftime('%Y-%m-%dT%X')
    log = json.dumps({
        'timestamp': timestamp,
        'level': level.upper(),
        'message': message
    },
    separators=(',', ':'))

    print(log)


def main():
    log("info", "test")


main()
