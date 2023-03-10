+++
title = "One Day Challenge: Life"
date = 2020-03-17
+++

[Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)
is a classic
[Turing-Complete](https://en.wikipedia.org/wiki/Turing_completeness) simulation
of [Cellular Automata](https://en.wikipedia.org/wiki/Cellular_automaton). Which
is a very fancy way of saying it's a simulation composed of simple rules
governing cells on a grid. However using these simple rules the cells form a
system complex enough to simulate any other system.

Cellular Automata are a great example of [Emergent
Systems](https://en.wikipedia.org/wiki/Emergence), a system that is capable of
more complexity than it would obviously seem. Conway's Game of Life is the most
famous of these systems. It is composed of a grid of cells, each of it can be
either alive or dead. From there the Game of Life can be reduced down to only 3
rules:

- If an alive cell has 2 alive neighbors it says alive
- If a dead cell has 3 alive neighbors it becomes alive
- In all other cases the cell dies of either starvation or overpopulation.

My implementation of the Game of Life was written in
[Clojure](https://clojure.org) since I have recently been learning and become
enamored with the language. Clojure is a modern LISP dialect that offers a
number of additions and cleanups over classic LISPs while still keeping the
clean syntax and powerful abstractions. Clojure also leans more heavily into
[Functional Programming](https://en.wikipedia.org/wiki/Functional_programming)
concepts such as immutability and atomic concurrency.

[My code can be found here](https://repo.rushsteve1.us/file?name=my-code/Clojure/life.clj&ci=tip).
As per the challenge I wrote it on one day, and with
the REPL-driven-development style that Clojure and other LISPs afford it was
actually a wonderful experience since I was able to write and test each function
in isolation and then join them together to create the larger program.

The implementation itself is actually very simple. It creates a 2D array of
booleans originally set to `false`, randomly sets a certain number of them to
`true` then goes through every cell to determine if it will live or die based on
the number of alive neighbors it has based on the rules above. The Game of Life
is itself a [Pure Function](https://en.wikipedia.org/wiki/Pure_function). Each
board state is only affected by the previous board state and nothing else,
meaning the intermediate forms also have no affect.

I did run into a few interesting challenges along the way. I had some instances
where I flipped the X and Y values of the 2D array, which is a constant danger
when using 2D arrays and why they are often abstracted away. I also had to come
up with a way to get the nth value of an array or `nil` instead of an error.

And last but not least... here's a video of it in action! The simulation has been
slowed down considerably so that it's watchable.

<video controls>
  <source type="video/mp4" src="https://repo.rushsteve1.us/attachdownload/life.mp4?page=ODC%3A+Life&file=life.mp4">
</video>
