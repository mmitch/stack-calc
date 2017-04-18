stack-calc
==========

[![Build Status](https://travis-ci.org/mmitch/stack-calc.svg?branch=master)](https://travis-ci.org/mmitch/stack-calc)
[![Coverage Status](https://codecov.io/github/mmitch/stack-calc/coverage.svg?branch=master)](https://codecov.io/github/mmitch/stack-calc?branch=master)
[![GPL 2+](https://img.shields.io/badge/license-GPL%202%2B-blue.svg)](http://www.gnu.org/licenses/gpl-2.0-standalone.html)

simple stack calculation engine without any deeper meaning

This is just a coding exercise.


language
--------

`stack-calc` implements a stack (actually a stack of stacks ;-) and
can do simple calculations with the values on the stack.

### tokens

A command is split into tokens separated by whitespace.  Any token
that is not an operation or a group delimiter will be put on the
stack.  These tokens should only be numeric values or everything will
break.

### operations

(notation: *T1* is the value at the top of the current stack, *T2* is
the second-to-top value and so on)

 - `+` will add *T1* and *T2* and put the result on the stack
 - `-` will take *T1*, subtract *T2* from it and put the result on the stack
 - `*` will multiply *T1* and *T2* and put the result on the stack
 - `/` will divide *T1* by *T2* and put the result on the stack

 - `!+` (`!-`, `!*`, `!/`) will repeatedly execute `+` (`-`, `*`, `/`)
   unless there is only one value left in the current stack

 - `d` will drop *T1* elements from the beginning of the current stack
 - `di` will drop *T1* elements from the beginning of the group at *T2*

 - `seq` will generate an integer sequence from `1` to *T1*

### groups

 - `( … )` creates a normal (sub-)stack.  It is evaluated while it is
   parsed and after parsing the whole stack is replaced by its top
   value.  This stack type is useful to set boundaries for a repeated
   command (`!+` etc.).

 - `[ … ]` creates a list.  It is evaluated while it is parsed, but
   after that the list is retained.  An operation will be applied to
   every list item and create a result list *in place*.  Operating on
   two lists will create something like a *cross product* consisting
   of nested lists.

 - `{ … }` creates a block.  In a block, operations are not evaluated
   during parsing - only groups are.  Subgroups will be evaluated
   normally.  This will be used to create named functions, but this is
   /not yet implemented/.

The implicit initial main stack is a normal stack (`( … )`): It is
evaluated and its top value is returned.


examples
--------

 - `1 2 +` adds 2 to 1
 - `2 5 /` divides 5 by 2
 - `5 seq !+` adds up all integers from 1 to 5
 - `( 9 seq !+ ) ( 15 seq !+ ) -` adds up all integers from 10 to 15
 - `15 seq 9 d !+` does the same.  Both variants are very inefficient
   for big numbers.
 - `6 seq !*` calculates !6
 - `[ 10 20 30 ] 2 *` doubles every value in the list


REPL
----

Running `stack-calc` as a command enters REPL mode.  Every line of
input is processed and the result (the top value of the stack after
processing) is printed.


Modulino
--------

You can `require stack-calc;` and then call the `execute()` method
with your command as a parameter.  The command will be processed and
the result returned.

This is currently not very useful as `stack-calc` pollutes the
`main::` namespace.  This feature only there to make proper testing
possible.


installation, compiling, tests etc.
-----------------------------------

see `Makefile`


copyright
---------

Copyright (C) 2017  Christian Garbs <mitch@cgarbs.de>  
Licensed under GNU GPL v2 or later.
