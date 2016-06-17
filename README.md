# RubyDictionary

Instructions

Code

Given a list of words (words.txt), The program generates two output files, 'questions' and 'answers'. 'questions' will contain every sequence of four letters that appears in exactly one word of the dictionary, one sequence per line. 'answers' will contain the corresponding words that contain the sequences, in the same order, again one per line.

An example:

Say this is your dictionary:

    arrows
    carrots
    give
    me

'questions' would contain:

    carr
    give
    rots
    rows
    rrot
    rrow

and 'answers' would have:

    carrots
    give
    carrots
    arrows
    carrots
    arrows

'arro' wouldn't show up in 'questions', because it appears in two words
