# Programming Languages @ UniMiB
![Socrates](https://upload.wikimedia.org/wikipedia/commons/c/c0/Metropolitan_David_Socrates_3.jpg "Socrates")
> *“The only true wisdom is in knowing you know nothing.”*, Socrates

## Introduction
Prolog, Common Lisp &amp; C code listings, resources et al for the **1819-2-E3101Q108** (Programming Languages) course @ Università degli Studi di Milano-Bicocca.

The repository is structured in laboratories (**LAB-[Timestamp]** format), projects (**PROJ-[Name]** format) and miscellaneous directories (gists, playgrounds and whatnot).

## Prolog
  ```prolog
  echo(out, 'Hello World!').

  1 ?- echo(out, X).
  X = 'Hello World!'.
  ```

  ### References
  - [The Prolog Dictionary:](http://www.cse.unsw.edu.au/~billw/prologdict.html) A comprehensive reference for SWI-Prolog (ISO & Edinburgh).
  - [The Prolog Wikibook:](https://en.wikibooks.org/wiki/Prolog) An essential and quick reference/primer for anyone delving into Prolog for the first time.
  - [Prolog Syntax and Semantics](https://en.wikipedia.org/wiki/Prolog_syntax_and_semantics)
  ### Books
  - [Prolog Programming for Artificial Intelligence - Ivan Bratko]()
  - [The Art of Prolog - Leon Sterling]()
  - **[Prolog - Wikibook](https://en.wikibooks.org/wiki/Prolog)**
  - [Learn Prolog Now](http://www.learnprolognow.org/lpnpage.php?pageid=online)
  - **[Power of Prolog](https://www.metalevel.at/prolog)**
  ### Other
  - [SLD Resolution:](https://en.wikipedia.org/wiki/SLD_resolution) How does Prolog resolve queries? *Selective Linear Definite* clause resolution!
  - [Tail Call Optimization (TCO):](https://en.wikipedia.org/wiki/Tail_call) How does Prolog optimize recursive rules? Unrolling the rule into a loop whenever
  - [Efficiency of Prolog](https://www.metalevel.at/prolog/efficiency)