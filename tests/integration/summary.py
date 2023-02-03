#!/usr/bin/env python3
# -*- conding: utf-8 -*-


def _process_data(elem, result):
    name = elem[0].strip()
    start = int(elem[1])
    end = int(elem[2])
    interval = end - start
    result[name] = interval


def show_summary():
    with open("execution_log.txt") as log:
        lines = log.readlines()
        iterator = iter(lines)
        result = {}
        data = zip(iterator, iterator, iterator)
        for elem in data:
            _process_data(elem, result)

        for test in sorted(result.items(), key=lambda v: v[1], reverse=True):
            print("Test {:.<64} {:>4}s".format(test[0] + ": ", test[1]))


if __name__ == "__main__":
    show_summary()
