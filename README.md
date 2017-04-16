stack-calc
==========

simple stack calculation engine without any deeper meaning

This is just a coding exercise.


language
--------

`stack-calc` implements a stack (actually a stack of stacks ;-) and
can do simple calculations with the values on the stack.

### tokens

A command is split into tokens separated by whitespace.  Any token
that is not a special command will be put on the stack.  These tokens
should only be numeric values or everything will break.

### commands

(notation: *T1* is the value at the top of the current stack, *T2* is
the second-to-top value and so on)

 - `+` will add *T1* and *T2* and put the result on the stack
 - `-` will take *T1*, subtract *T2* from it and put the result on the stack
 - `*` will multiply *T1* and *T2* and put the result on the stack
 - `/` will divide *T1* by *T2* and put the result on the stack

 - `!+` (`!-`, `!*`, `!/`) will repeatedly execute `+` (`-`, `*`, `/`)
   unless there is only one value left in the current stack

 - `(` will start an empty sub-stack
 - `)` will take the top value of the current stack, remove the
   current stack, restore the previous stack and put the saved value
   onto it


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


examples
--------

see tests (`t/*.t`)


copyright
---------

Copyright (C) 2017  Christian Garbs <mitch@cgarbs.de>  
Licensed under GNU GPL v2 or later.
