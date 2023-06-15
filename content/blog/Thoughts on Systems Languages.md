+++
title = "Thoughts on Systems Languages"
date = 2022-01-18
[taxonomies]
category = ["programming"]
tags = ["opinion"]
+++

This is a somewhat random collection of my thoughts on a variety of
[Systems Programming Languages](https://en.wikipedia.org/wiki/System_programming_language)
that I have tried over the years.

I rate languages both on their core syntax and on the breadth and quality of
their standard library. Community and package ecosystem is also occasionally
relevant to my considerations.

Note that I consider "systems language" to be those that can and will AoT compile to native Linux executables using their normal toolchain.

Everything written here (and on this site in general) is my own personal opinion.
This page in particular is really nothing more than me ranting and raving for a couple pages.
It's fine if you disagree.

## C

When everything looks like a nail, C is a double-edged razor blade. A language
that puts a lot of power in the hands of the programmer, but equally does
nothing to prevent mistakes.

For what it was **designed for** (Operating System development), C is a great
language that exposes the hardware underneath and allows for the kind of hacks
you need to get an OS running well.

But 90% of the software written in C isn't that. Most of the software is
user-space libraries and utilities that have no reason to have such low-level
hardware access, and that are hindered by the spartan nature of C and it's
standard library.

TL;DR it's a good language, but it's constantly misused.

## C++

A design-by-committee monstrosity. A language formed only of accretion and never
removal. Even similarly-scoped languages like Java feel trim and well thought
out in comparison.

In my opinion there are very few redeeming qualities to the language itself, and
the STL has gone from a bad joke which (required libraries like Boost to supplant)
to a massive collection of "features" that exist only to band-aid the problems.

C++ simply rode on C's coattails to popularity, inheriting its syntax-style, tooling,
and much of its ecosystem. If C++ was a person, they were born rich.

#### Anecdote

I work in Unreal Engine for a living, so I do know C++ reasonably well.
Or more accurately I know *Unreal Engine's flavor* of C++ reasonably well.

Epic had to re-invent most of the STL to get a decent experience AND bolted on
a pretty nice Garbage Collector. Yes they added a GC to their high-performance AAA
game engine. It's honestly the nicest version of C++ I've ever used.

## D

A much better thought out version of C++, and generally a quite pleasant
language overall. Though it's chronically unpopular despite this. I think it
unfortunately fell in the niche of being too similar to existing languages to
create it's own identity.

But it has a reasonably good standard library and decent tooling. Though it does
feel like they have a few different conflicting ideas going on in the language
and that it's grown a little too big, but otherwise still very pleasant.

I wish it was more popular, because then it could be my favorite systems
language. But the lack of support and wider community kills it.

## Rust

This used to be my favorite language bar-none (that spot may have been taken by
Elixir these days), but I've slowly become somewhat disillusioned with it.
There's just too much language and syntax. Between lifetimes, turbofish,
oddities around numeric conversions, and other papercuts.

It's still an incredible language though that is really pushing the state of
the art for programming. Fantastic tooling, a small but well thought out
standard library complemented by a great package manager, and a thriving
community.

Still my go-to for serious systems projects, if only for the great package
ecosystem, but for many smaller things it's too complex and paralysis-of-choice
is a problem at times.

## Go

I feel incredibly mixed about this language. I used to hate it, then started to
like it, then hated it again, and now I don't even know how I feel.

On one hand the tooling is (these days) quite good, it has a strong ecosystem,
and a big and useful standard library.  But on the other hand the language
itself feels far too simplistic and makes the language genuinely much harder to
work with. The decade of debate and eventual addition of generics is the perfect
example of this.

In the end I think Go is just an "alright" language. It does a passable job, but
never excels.

## Nim

I keep trying this language, hoping that I'll like it, and every time I'm
disappointed. The tooling seems nice at first glance, but ends up clunky with a
dozen CLI flags. The standard library is big with lots of features, but can be
awkward and unwieldy at times (though it's usually fine).

The language itself seems like it can't decide what it wants to do. At times
it's very similar to Python, at other times it seems to want to be Pascal. And
then it'll introduce a weird new bit of syntax that's strange and awkward.

In the end I've had a lot of problems ever time I've tried Nim, and yet I still
*want* to like it.

## Crystal

I've admittedly not tried Crystal very much, but it seems right up my alley. I'm
a big fan of Ruby's syntax so a compiled systems language in that style seems
really nice. Tooling and standard library both seem fairly good, with some nice
features and no real omissions.

From my brief usage, I'd say the only real problem with Crystal is maturity.
The first stable release was less than a year ago, and the community is still in
the very early stages. But I'm exited to see where it'll go.

## Pascal

I tried this out curiosity and because I wanted to try using
[Lazarus](https://www.lazarus-ide.org/) to fiddle around with GUI development.
Pascal is clearly dated, and considered a dead language by many, but it still
feels surprisingly nice to me. The syntax is a bit different, but familiar
enough and quite consistent.

But it's definitely a language that's rotted over the stagnant years. The
standard library is confusing and poorly documented, there's very little
community and ecosystem, and what there is just feels dated.

However it's still a surprisingly pleasant language and quite technically
impressive for when it came out.

# Languages I want to Try

These are languages that I have little-to-no experience with, but I want to try
out at some point. For some I'm waiting on a stable release to try, others I
just haven't gotten to.

## Ada

A highly interesting language that did a lot of what makes Rust impressive long
before Rust was even an idea. Clearly a very robust language and seems very well
suited for things like microcontrollers and important mechanical systems.

It's a shame it's not very popular these days, though it seems to be growing
slightly. The confusing half-proprietary nature of it definitely doesn't help
though, and has been the biggest reason I've avoided it so far.

## Zig

The new darling child of language design, intended to be a better version of C
without growing into a larger scope. Seems like it'll be quite nice when
finished, but it's still probably years from a stable release so I'll wait until
then.

Overall though I like it's simplicity, but I question some of its syntax choices.

## Pony

"Actor systems programming language" is a phrase that's guaranteed to get my
interest, so Pony has it. But development seems slow and there's very little
community yet. Most people haven't even heard of it. Still I'm hopeful.

## V

Made famous by its incredibly bold, and largely false, claims of performance and
features, V is still a fairly interesting language that could have a lot of
technical merit one day. If they can ever achieve the claims they made.

## Dart

Google's odd-duck. Initially created as an alternative to JavaScript in the
browser, that project was scrapped and Dart found a new home as the
implementation of the Flutter GUI framework.

And that's basically where it stayed. It seems like an interesting language
overall, and possibly generally useful, but outside of Flutter it seems like no
one really cares about it. A killer app that was *too* killer.

**Update**: Spent a day looking into it more seriously (not enough to move it up yet)
and I liked what I saw. I still have a number of concerns with it, but the tooling
and ecosystem seems pretty nice. The debugger tools in particular seem very
cool.

## Swift

Apple's odd-duck, much like Dart. It was their replacement for Objective-C in
their own frameworks, but it's since grown in ability and now could be
considered a stand alone systems programming language of it's own. Though it
seems like no one is using it for that either.

## Kotlin Native

Seems interesting, but I'm sort of confused by what's going on with it.
It seems like the Native version loses a lot of compatibility with the rest of
the Kotlin ecosystem. But it still seems like a nice setup, Kotlin is a pretty
nice language overall.

## OCaml

I haven't used any languages in the ML family very much,
but OCaml is the frontrunner.
Syntax is odd to my untrained eye, but I've heard many good things about
the language, and it seems to be doing quite well these days.
The recent (at time of writing) addition of Multicore OCaml is a huge
improvement and I commend the devs for pulling it off.

## Haxe

Since it can compile to C++ and then to native seemingly quite easily, I'll allow Haxe on this list. I think Nim does something similar under the hood.

This language seems to have carved a niche for itself in porting away from Flash. But it seems reasonably nice nonetheless, but I don't think it has much of an ecosystem. Though I do see some native game development related things, so there might be more going on here.

## Common LISP

The veberable LISP can be compiled to native code with SBCL and some other compilers.
I honestly have no real motivation to learn CL,
every time I look into it something feels
dated or draconian.
Even Pascal felt fresher to me.
This isn't a dig against LISPs in general, I quite like them.
But PLT has come far since CL's day.

# Honorable Mentions

These languages or setups *can* be used to generate
native binaries, but they usually do so
by simply bundling up a runtime with the code.
Still, for many use-cases this is perfect and lets you use your favorite language.

I'm also throwing in here secondary tools that can compile to true native binaries,
but that aren't part of the normal toolchain for the language.

- Elixir Burrito or Bakeware (or just Releases)
- Java/Clojure/Kotlin with GraalVM
- PyInstaller
- Julia PackageInstaller
- Deno's `compile` subcommand
- Mono's `mkbundle`
