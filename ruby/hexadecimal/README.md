# Hexadecimal

Convert a hexadecimal number, represented as a string (e.g. "10af8c"), to its decimal equivalent using first principles (i.e. no, you may not use built-in or external libraries to accomplish the conversion).

On the web we use hexadecimal to represent colors, e.g. green: 008000,
teal: 008080, navy: 000080).

The program should handle invalid hexadecimal strings.


a = 10
b = 11
c = 12
d = 13
e = 14
f = 15

af -> 10 * 16^1 + 15 * 16^0 -> 10 * 16 + 15 + 1 = 175

* * * *

For installation and learning resources, refer to the
[exercism help page](http://exercism.io/languages/ruby).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

In order to run the test, you can run the test file from the exercise
directory. For example, if the test suite is called
`hello_world_test.rb`, you can run the following command:

    ruby hello_world_test.rb

To include color from the command line:

    ruby -r minitest/pride hello_world_test.rb


## Source

All of Computer Science [http://www.wolframalpha.com/examples/NumberBases.html](http://www.wolframalpha.com/examples/NumberBases.html)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
