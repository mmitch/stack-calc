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
 - `di` (drop indirect) will drop *T1* elements from the beginning of
   the group at *T2*

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
   normally.  This is used to create the body of named functions.

The implicit initial main stack is a normal stack (`( … )`): It is
evaluated and its top value is returned.

### named functions

`defun` will define a function named *T1* (this is a rare instance
where a token can (and should - don't redefine numbers to functions!)
be a string) that expects *T2* arguments.  The function's code body is
given via a block a *T3*.

When later a token is encountered that is the name of a previously
defined function, the following happens:

 - as many arguments as defined are taken of the current stack
 - a temporary stack is created
 - the arguments are added to the temporary stack
 - the function's code body is added to the temporary stack
 - the temporary stack is evaluated
 - the top element of the evaluated temporary stack is put onto the
   current stack


examples
--------

 - `1 2 +` adds 1 to 2
 - `2 5 /` divides 5 by 2
 - `5 seq !+` adds up all integers from 1 to 5
 - `( 9 seq !+ ) ( 15 seq !+ ) -` adds up all integers from 10 to 15
 - `15 seq 9 d !+` does the same.  Both variants are very inefficient
   for big numbers.
 - `6 seq !*` calculates !6 (factorial)
 - `[ 10 20 30 ] 2 *` doubles every value in the list
 - `{ seq !* } 1 fac defun [ 4 fac 6 fac ]` defines a factorial
   function named `fac` that takes one argument.  Note that the
   definition all by itself evaluates to nothing and leaves an empty
   stack.  Two prevent a stack underflow on execution, a list
   containing two invocations of `fac` has also been added.


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


installation
------------

To install all dependencies via `cpanm` run `make installdeps`.  If
you use another installation method, run `make -s showdeps` to show what
is needed.

The `stack-calc` script currently is self-sufficient when all
dependencies are installed, just put it where you want it to be.


copyright
---------

Copyright (C) 2017  Christian Garbs <mitch@cgarbs.de>  
Licensed under GNU GPL v2 or later.
