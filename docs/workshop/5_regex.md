## When there's non-standard semi-structured data formats

Every now and then, we encounter semi-structured data that isn't in a commonly supported
format like JSON or XML. One example is Operational Technology (OT) data such as 
Controller Area Network (CAN) data collected via Linux's `can-utils` library's `candump`
command. The output looks something like this:

``` text
(1544106679.432583) can0 562#122DF953813CA2
(1544106679.631330) can0 1F0#4C96281B62ACBC20
(1544106679.830333) can0 687#C3F26E
(1544106680.029125) can0 412#06C136
(1544106680.228086) can0 67E#01C65274D19FAC6D
(1544106680.427065) can0 4FA#5F6502615110B55A
(1544106680.625958) can0 429#6FB48932FBCECE26
```

There's four distinct pieces of information in each line

1. `(1544106679.432583)` is the unix epoch timestamp in microseconds
2. `can0` is the network name
3. `564` before the `#` is the destination ID
4. `122DF953813CA2` after the `#` is the data for the destination

### Solution: Regular Expressions
[Pythex.org](https://pythex.org/), [regexr.com](https://regexr.com/), [regex101.com](https://regex101.com/)
and similar online tools provide ways to rapidly construct a **Regular Expression** (regex)
to parse arbitrary strings using pre-determined rules.

!!! note "Semi-structured to Structured"
    1. Can you write a regex that will match a `candump` data sample?

    2. Can you name each matched part of the data as part of the regex?

    3. How can we try this in python?

    4. Are you able to convert the output of the regex into a Python dictionary?

    5. Are you able to output the dictionary you just created to a CSV file?

## Speeding up the slow native Python regex library
![Speedup](5_images/i_am_speed.jpg)

There are two options for somewhat increasing the speed of a regex in Python if you need
to parse lots of non-standard semi-structured data.

1. [Google's `re2`](https://github.com/google/re2): re2 and it's Python wrapper [`google-re2`](https://pypi.org/project/google-re2/)
provides methods for `compiling` regular expressions. This will require your dev environment
to include C compilers and build tools most python packages don't require.

2. [Intel's `hyperscan`](https://github.com/intel/hyperscan): Hyperscan is a largely stale
project from Intel that leveraged some of their CPU level optimizations for regular expressions
to achieve top performance for the job. Unfortunately, it's not easily used in Python and
only outperforms `re2` when doing particularly complex or large scale operations.