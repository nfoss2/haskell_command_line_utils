# Functional Programming Midterm

This project implements a number of common command line utilities as Haskell programs.

## Run Instructions

- Open the project in the docker container (created by professor)
- Run `cabal build`
- Run `cabal -v0 run` <whichever command util> <arguments>

Examples:

- `cabal -v0 run cat test/lorem.txt`
- `cabal -v0 run echo Natalie is the best`
- `cabal -v0 run rev test/haiku.txt`


## How this midterm was graded

This repository has a number of automated tests that will run every time you
push your code. Each test has a number of points associated with it. Passing all
tests will result in a grade of 100%.

Important to note that we are **not implementing all of the features** included
in the actual versions of these tools. We are not handling any flags, and we are
not taking any data directly from standard input besides file names/urls. Look
at what the tests are testing, and implement the tools based on that
specification. We will also spend some time in class covering how each of these
tools should function.

You can push your code to run the tests and check your grade as many times as
you want before the assignment deadline. At the deadline, your repository will
be frozen and graded as is.

You can test your code locally by running the exact commands ran in the tests
(found in the `.github/classroom/autograding.json` file).
