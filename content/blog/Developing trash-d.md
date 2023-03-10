+++
title = "Developing trash-d"
date = 2022-06-13
[taxonomies]
category = ["programming"]
tags = ["d"]
+++

This is a rewrite and update of a talk I gave at
[DoomConf August 2021](https://doomconf.netlify.app/aug-2021/rushsteve1/trash-d)
about [`trash-d`, a "near drop-in
replacement for rm that uses the trash bin"](https://github.com/rushsteve1/trash-d).
(There is a very scuffed [recording of half the talk here](https://youtu.be/MqHfOQXVCy4))

## The D Programming Language

`trash-d` is written in the [D programming language](https://dlang.org/), which
was first released in 2001 as an alternative to C++. Since then it has been
continually updated, but only mildly popular at best.

Some notable features include...

- A garbage collector
- An actual `string` type
- Generics and templating
- Good support for dynamic arrays and hashmaps
- Contract programming
- Easy C and C++ interop
- Lambdas and higher order functions
- Built in unit testing
- [Uniform Function Call Syntax](https://tour.dlang.org/tour/en/gems/uniform-function-call-syntax-ufcs)

And a whole bunch of other things I forgot to mention here.
In particular I am a big fan of UFCS and think more languages should use it.

D also has a fairly robust standard library with things like: ranges and
iterators, many utility functions, fibers and continuations, SQLite bindings,
and a `getopt` implementation.

All this probably makes D sound pretty nice but there are some weird bits.
Unicode support is a bit all over, with different types such as `char` and `dchar`
(`string` seems to mostly just do the right thing, so that's nice).
There are both Classes and Structs with a lot of feature overlap.
And in general it's a big standardized language with a lot of features, and even
multiple different compilers that you sometimes have to worry about.

All that said the worst part about D is that the ecosystem is honestly quite dead.
It still has a small and loyal following, but outside of that there's really not
much going on. Which is a real shame, I think if the ecosystem was bigger and more
vibrant I would be using D for a lot more projects.
Though the renewed interest in systems programming over the last few years has
led to some more people (like me) discovering D, so there's some hope...

In general if you're looking for something nicer than C++, less complicated than
Rust, and more featureful than Go, then maybe give D a try. Or if you just wanna
try out a cool language with some awesome but less common features.

## Beginnings of trash-d

I had sort of been annoyed for a while about the destructive nature of the
standard `rm` command. You get no second chances, no warnings that you're about
to blow away something important. Yes I know about `-i`, but I am lazy and forgetful.
So I had thought about making a simple tool to use the trash bin instead.

Around the same time that I was first looking into D a friend of mine accidentally
`rm -rf`'d his music folder and deleted his entire collection. This was the
impetus that I required to start this project.

At first I started out writing it in Bash, before quickly giving up on that because
Bash is a horrible language to actually write programs in and switching to D.
So far D has been a great choice, mostly because `trash-d` is simple enough that
I don't require anything other than the standard library. But also because of the
somewhat renewed interest in the language there now existed good D compilers for
most UNIX-like systems.

So I set off on what I thought would be a simple tool...

## The Long Road

Turns out that implementing `trash-d` has been a much longer process than I expected.
There have been a lot more edges and corners than I anticipated.
Well, I say that but it's been spread out over many months and now 17 "versions".
A number of versions are missing as I would bump, find a bug, bump again, and then
finally tag a release (they're all in the commit history though).

The entire point of the project was to emulate the semantics of GNU `rm` as much
as possible, to the point that you could add `alias rm=trash` to your config and
not notice any difference. `trash-d` mimics all of `rm`'s flags
and most of its error messages and semantics, so for the majority of users this should
be more than enough.

This was ultimately very tricky. `rm` has a lot of
subtle implicit behavior, and the interactions between its flags can be opaque.
For example what happens if you do `rm -fi`? Which wins, the `f` or the `i`?
Or what happens when you try `rm -r` a symlink to a folder?
And did you know that there are about half a dozen different versions of `rm`
that are all subtly different from each other? I aimed for GNU `rm`, but
I made sure to take a look at all the others too.

Of course on top of `rm` compatibility I had to make sure that `trash-d`
properly implemented the
[FreeDesktop Trash Specification](https://specifications.freedesktop.org/trash-spec/trashspec-latest.html).
Which was surprisingly not too bad. A few minor edge cases around `directorysizes`
and making sure there weren't any naming conflicts, but in general the
standard is surprisingly straightforward.
Getting a trashed file to show up in Dolphin the first time was a big dopamine hit :)

The worst issue that I ran into was learning that the `rename` syscall on Linux cannot
move files across filesystems. This ended up being a huge pain for both me and
others, but I did eventually manage to resolve in a reasonably nice way.

But along the way I've gotten a lot more experience with D, had some outside
contributors make PRs, garnered 80 stars at the time of writing, and made something
that I find really useful. I've even had other people message me to say that
`trash-d` saved their bacon!

## Competitors

Now I will be the first to admit that `trash-d` is not an original idea.
There are already quite a few CLI trash tools on GitHub, and honestly I'm surprised
there's no distro that's made their own or shipped with one by default.

But I think `trash-d` has some important advantages over all the other versions
that I've seen.

1. It's compatible with `rm`. None of the others seem to make this a priority,
and some of them even make the explicit point that they're *not* compatible.
I think that's a real shame, to me the point of a tool like this is to save me
from the mistakes I would make with `rm`.
2. Most of the alternatives are written in Python or Bash. Nothing wrong with this
per-say, but I think it's another missed opportunity. Not every system has Python
or Bash (before you say "every system has Bash" I remind you that the BSDs exist).
`trash-d` may require a D compiler, but it can be easily compiled to a single
static executable that can then just be copied onto other systems.

## Conclusions and Help

All this is to say that I have thoroughly enjoyed working on trash-d and I hope
to continue doing so and get it to a really solid state where lots of people
can use it without issue.

And I need your help! Tell your friends, package it for your distro, open
issues or even make PRs! Shoutout to [ninedotnine](https://github.com/ninedotnine)
for being the first contributor!

There are some packages already:

- [Fedora COPR package](https://copr.fedorainfracloud.org/coprs/gagbo/trash-d/) by Gagbo
- [OpenBSD Ports package](https://openports.se/sysutils/trash-d) by Brian Callahan
- [AUR package](https://aur.archlinux.org/packages/trash-d) by Occhioverde03
- [A Guix package definition (with a fixed `dub`)](https://gist.github.com/flatwhatson/8cb2293d92833b6463af8b8f2d44cdbc) by Flatwhatson

These are in-addition to the [statically linked version and packages I provide on GitHub](https://github.com/rushsteve1/trash-d/releases). Let's get `trash-d` on everything!
