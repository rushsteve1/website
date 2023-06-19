+++
title = "Steve's Bad Guide to Programming"
date = "2022-03-08"
+++

This is my attempt to write a very bad guide to programming for a friend.
The focus is not on code, but on the key concepts behind programming and on the
wider ideas that are related to the field.

I'll probably end up revising and adding to this a lot over time, so apologies for
any mistakes or typos.

This skips over really basic ideas like bits and bytes, and assumes that the
reader is reasonably tech-literate and willing to look things up. Let me say that again:

<div style="text-align:center;">
  <strong style="display:block;">If you do not understand something, look it up!</strong>
  Another word for "programmer" is "professional search-engine user"
</div>

The internet was created *by programmers for programmers*, and they have put all of the information
you need on it. When it comes to programming info, if it's not on the internet then it
probably doesn't exist. So your first response should **always** be to open your
search engine of choice and start typin'. If you take nothing else away from this guide,
remember this.

## Key Concepts

These are the most important ideas in programming. Everything is built off of
these, no matter what language or system you're on.
Because these are so fundamental, they're very tightly knotted together.
So one concept might not make sense until you read all of them, and that's OK.

If you read any section of this guide, read this one. This is what this guide was
written for, so that you can understand when someone speaks in these terms.

### Values

A value is exactly that, a single value. Like the number `5` or the letter `'b'`.
Values are the simplest concept, but are at the core of everything. They are the
data you are operating on and working with.

Values always have a *type*. `5` is a number (an integer), `'b'` is a character,
and so on. Depending on the *type* of a value they can be very simple, or very
complex.

Many languages also have the concept of `null` or `nil`. This is the **lack** of
a value. It represents nothing, or the lack of anything.

To use a value directly in code you write it as a *literal*, usually as part of
an expression.

### Variables

A variable is a name for a *value*. But the important point is that that the value
can *vary* (hence the name "variable"). The name can point to different values
at different times, though it can only have one value at any one time.
There are also *constant variables* that cannot change, which are useful
in various situations.

Depending on the programming language, variables might have a *type*. This means
that it can only hold values of that same type. In other languages variables can
hold any *type* at any time, but you have no way of knowing unless you check its
value.

Variables can be used in expressions. When they are replaced with their value at
that moment, which will be looked up and used in the expression.
So in the expression `x + 5` if `x` is `10` then the expression will evaluate to `15`.

### Keywords

In a programming language a *keyword* is a word that has a special meaning in
that language. This includes many things such as `if`, `while`, `def` and so on.
These are the core constructs of the language itself.

Any word or series of characters in a program that is NOT a keyword or a literal value
will usually be treated as using a variable or function and evaluated as an expression.
So in `x + 5` since `x` is not a keyword or a literal it will be treated as a variable and
have it's value looked up.

Most programming languages will prevent you from creating a variable or function
with the same name as a keyword.

The normal arithmetic operations are usually treated as keywords, but are sometimes
more complicated than that.

### Types

Types are what kind of value something is. There is a whole field of math called
"category theory" around types. But the key idea is that it is the type of data.
Numbers, letters, a sentence, a list of words, etc.

There are a lot of different types, and I'll go into the main ones in the Data Types
section below.

Also understanding types is *always* important. You might see things like "dynamically
typed" online and people saying "you don't have to care about types".
They are wrong, you always have to care.

### Expressions

An expression is a piece of code that, when run, will evaluate to a value.
`5 + 5` is an expression that evaluates to `10`. The simplest versions are
called "literal expressions" and are just a value written literally like `5`, which
is just an expression containing only the value `5`.

Expressions can come from doing math, calling a function, array operations, and
a whole variety of different actions. They are one of the most common things you
will do when programming.

An expression is not a value in itself. When the line of the program containing the
expression is run then the expression will be evaluated and a value will be
determined. So the expression `x + 5` will evaluate to `15` if `x` is `10`, but
if `x` is changed to `20` then the expression will evaluate to `25` the next time it is run.

Variables and function returns do not contain expressions, only values created by expressions.

Expressions can contain other expressions, and most languages use parentheses to
allow the programmer to control the order that these expressions will evaluate.
Otherwise the language will follow its own order of operations, which is usually
PEMDAS (but not always!).

### Statements

A statement is the opposite of an expression, it is a piece of code that does
NOT evaluate to a value. This often includes many constructs of the language
itself, such as control flow with `if` and `while` or defining functions or
variables.

Statements generally contain expressions along with keywords or functions to
perform whatever task is required.

Some languages blur the line between statements and expressions by making things
that would normally be a statement act as an expression. This can lead to more
compact code, but can also be confusing for anyone not used to it.

In most languages statements end at either a semicolon or the end of the line.

### Functions

Functions are blocks of code that can be *called* from other places.
The simplest, and best, use for functions is that they let you re-use code in
as many places as you want. In a way they are like a fancier copy-paste, where
you can think of the code inside the function as being copied to the place where
the function is called.

Functions generally operate on the principle of input and output.
Values are given to the function as *arguments*, which will become variables to
the code inside the function.
The function can then *return* a value when it is done that will be passed back
up to the place that called it.

Calling a function, which in C-style languages looks like this
`functionName(arg1, arg2)`. This is an *expression* that evaluates to the
return value of function.

Functions are also sometimes called "methods" or "procedures". While there are
small differences, these all mostly mean the same thing
(the distinction is outside the scope of this guide).

There's also a more complex concept known as "first-class functions" where a
function itself (not it's return value) can be treated as a value.
This is useful for "higher-order functions", which are functions that
take other functions as arguments or return them as values.
You don't have to understand this now, but if you see these terms that's
what they're referring to.

#### Side-Effects

Functions generally work on their arguments and return value,
and when they do only that they are called "pure functions".

But often times you need to do more complex tasks than just return a value.
This could be reading/writing to a file, playing a sound, displaying graphics,
etc.
All the fun things that a computer can do.
These are called *side-effects* and make a function impure.

This is a commonly discussed idea in programming, so while it's not a "key
concept" I thought it was worth mentioning for one very important reason:
Side-effects are often where errors come from.
You tried to connect to the internet but had no WiFi, you tried to read a file
that doesn't exist, your GPU doesn't support some fancy graphics feature.
When doing anything with side-effects, you have to be careful and think about
what could go wrong.

## Data Types

There are a lot of different types of data, but there are a number of major
and really common types.

There are also *compound types*, that are a bunch of another type that is
grouped up in some way, such as in a list or a table.

### Booleans

A Boolean (capitalized, it's named after George Boole) is a type that has only
two values: `true` and `false`. Nothing else. It is the simplest data type and
can be represented in a single bit.

#### Truthy-ness

Many languages also have the concept of *truthy-ness* where types other than
Booleans can be considered `true` or `false`.
This means that in any place that the language expects a Boolean,
such as inside the condition of an `if`, a different non-Boolean type can be used
and it will be treated as if it were `true` or `false`.
What is considered which depends on the language,
so look it up for your language of choice.

For example C does not have Booleans, and treats any value other than the
integer `0` as `true`.

### Numbers

A number is exactly that, a number. But there are a surprising number of
varieties to them.

*Integers* are numbers that do not have a decimal place. Any time there would be
a decimal it is simply cut off. So `5 / 2` would become `2` because the `.5` is
just chopped off.

Integers can also be both *signed*, meaning that they can be negative,
or *unsigned* meaning that they cannot be negative.
Signed integers can hold half as large of a number, but can go both positive
and negative.

*Floats* are numbers that do have a decimal place. But for interesting reasons
doing math with them can sometimes come out very slightly wrong. These
"floating point errors" and are a known and well-treaded area, and there are
even standards to exactly *how* they are allowed to be wrong.
Floats are always signed.

#### Bit Size

When storing a number it will take up a certain amount of bits. The number of
bits determine how large of a number can be stored.

A *double* is a float that is twice as big. Some languages don't make the
distinction and all floats are doubles, but some do care.

There also exists the idea of "big integers", which are integers that can be
arbitrarily large. Not all languages have these, and most don't use them by
default.

#### Overflow

When an integer gets too big, in either the positive or negative direction, that
it goes over the maximum size it can be one of two things will happen:

- In languages with "checked" math an error will occur
- In languages with "unchecked" math the integer will *overflow*

When an integer overflows it will flip to the other side of its number line.
So for a signed integer it will go from it's positive maximum to its negative
maximum, or vice-versa. And for an unsigned it will go from its maximum to zero
or vice-versa.

### Characters

A character is exactly that, a single character. A letter, number, or symbol.
This type seems simple, but can carry a lot of nuance due to a complex problem:
Unicode support.

In older languages that do not support Unicode, a character is one byte and is
represented with ASCII. This generally means that it cannot represent anything
other than English characters and standard symbols. In fact in C the `char` type
is used for bytes as well.

But in modern languages *with* Unicode support, a character can be multiple bytes and
can be any of the large variety of languages and symbols that Unicode supports.
Some languages intentionally call Unicode characters "runes" or "graphemes" to
avoid confusion with the legacy `char` type.

Characters have to be marked in some way, usually by wrapping them in single quotes
like this `'b'`, though some languages use other ways like a slash in front.

### Arrays

Arrays are the simplest compound data type. They are a series of values listed
in order. You can access them by their position, normally called their "index".
Depending on the language you can add, remove, and re-arrange the elements of
an array as needed.

An important note: In most languages the index of arrays starts at ZERO not one.
So the first element is `0`, the second is `1` and so on. This is mostly for
historical reasons, but has become the norm so get used to it.

Arrays are also sometimes called "lists" or "vectors". In some languages these are
slightly different concepts and types, but for now just know that these are a series
of values in order.

### Strings

A string is a series of *characters*. They represent textual data, and can be
used as a literal value usually using double quotes `"like this"`.
Strings are often more complex than they seem, and many languages have a lot of
features around them.

Older languages tend to just represent strings as an array of characters
(or even bytes) but newer languages usually make strings a distinct type.

### HashMaps

This type goes by many names: HashMap, Hash, Map, Associative Array, Table,
Dictionary, etc.
But the idea is simple: It relates some *keys* with some *values*.

**Clarification:** The *keys* of a a HashMap are **also** values as I defined the
term above. This is a weird case of one word meaning two things.
The thing that a key points to is also called its "value", but is not the value of the
key itself.
In most languages the keys and values can be of almost any type,
so you can build your own associations between different things.

Think of it like an array where instead of accessing each element using its
index number, you access them using some other arbitrary key value. Each
key has only one associated value, and each key can only exist once in the HashMap.

HashMaps are usually not stored in any particular order, but this depends on
the language and implementation so check it first.

### Pointers

Honorable mention for the most hated and abused data type: The *pointer*.
If you think of the computer's RAM as one big array of bytes then a pointer is an index
into that big array. In some languages like C this is exactly how pointers actually work.
Another way to put it is that pointers are a special data type that can *point* to
other data.

But pointers are dangerous because there are a variety of security measures
and errors that you can run into. What happens if you try to use a pointer that
goes nowhere (`null` pointer)? Or use a pointer that's past the end of the RAM you have?
Or any other such odd case.
A "Seg. Fault" is the most common error that occurs when a bad pointer is used, so
you see that phrase a lot when talking about pointers.

Many languages do not have pointers in order to prevent them from being abused
and to stop bugs involved with them.

Getting the value of the data that a pointer is pointing to (which is not the value of the
pointer itself) is called "de-referencing".

### Others

There are a lot of other data types out there, and varying support for them
across different languages. Symbols, tuples, sets, keywords, classes, etc.
So when you encounter a new type, look it up. See what its used for and what
it can do.

## Concepts & Topics

These are broader topics in programming that have had many articles and books
written about them, but I think it is very important to know that they exist.
Once again I invite you to look up anything that you find interesting or want
to know more about.

### Programming Languages

There are many *many* programming languages out there. More are made every day.
Some are similar, some are radically different. Some are general purpose, some
are domain specific.

This is a massive topic that people have written many books on.
But the important thing to know from this guide is that those other languages
are out there. They each of their own strengths and weaknesses.
If you are struggling with or not enjoying a language, look around.

One of the best things that I think any intermediate-ish programmer can do
is to learn a new language or two. It can really broaden your horizons, and
helps you to think outside of just syntax.

#### OOP

I want to make a special mention of the most common paradigm that programming
languages have taken over the years: Object-Oriented Programming.

This has many variations and is a pretty deep topic itself, but I suggest doing
some research of your own once you are feeling more comfortable with the basics
to try and understand what OOP is.

Not everyone likes OOP, and it's gotten a bad rap lately. But it's still
everywhere so it's best to understand it.

#### Turing Completeness

Not be confused with the Turing Test, the idea of Turing Completeness comes from
the original papers published by Alan Turing in which he describes his "universal machine".
In this paper Turing proves that his universal machine can perform any calculation.

Therefore any programming language that meets the same criteria of Turing's
machine can *also* perform any calculation and is therefore considered
"Turing Complete".

This isn't really a key concept, but it's thrown around a lot so it's good to know.

### The Web Trifecta

Web browsers are massive and complex pieces of software that act as the near
universal platform for developing and accessing software.
But they can only really understand 3 programming languages:

- HTML defines the content and structure
- CSS defines the visual style and layout
- JavaScript programs the interactive functionality

Together they form the "Web Trifecta".
Of the 3 only JavaScript is a real Turing Complete programming language.

You do not *need* all 3. Many websites use little to no JavaScript, CSS can be
omitted if you're fine with a really ugly site. HTML is required (otherwise you
have a page with no content).

Both HTML and CSS can be generated by JavaScript, and this is the basis of many
front-end web frameworks.

### Programming vs Developing

This is a topic I can and probably will write another post about, but I wanted
to talk about it here for a moment as well.

Many people talk about programming and only consider the actual act of opening
their editor and typing code. But when we broaden the topic a little and think
about not just the act of programming itself, but the entire production of
*developing software* there is a lot more that goes into it.

When I say "developing software" I mean the process of going from an idea to
a finished program that people can use. This includes a wide variety of activities
including design, documentation, evaluating technologies, version control,
collaboration, testing, and of course programming itself.

Many schools and tutorials focus a lot on just the programming and really neglect
all the other aspects of *developing* that are equally if not more important.

### Version Control

When working with code, and **especially** when collaborating with others, it is
often pretty handy to have a way of recording the changes made to the code
in increments, and to leave notes about what you've done, and merge together
conflicting changes.
The tools for this are called "Version Control Systems" or VCS.

The most common VCS is Git, which was originally created for allowing collaboration
between Linux kernel developers. Because of this very prominent usage it ended up
just about everywhere and eventually gave rise to GitHub.

GitHub is just a site where you can create (public) Git *repositories* to store
your code and allow others to make contributions. It's popular and has a variety
of other features, but that's the core of it: It is a Hub of Git repositories.

### Software Licensing

When you decide to release the source code for a project publicly, you might want
to think about how that code is *licensed*, especially if you're hoping to get
outside contributions (or if you're contributing to someone else's project).

By default, under US copyright law, if your code does not have a license then
it is considered *proprietary* or "closed source".
Other people are not allowed to use it or modify it without your express permission.

But you can give **eveyone** permission through the use of a *license*.
Licenses that allow other people to use or modify your code as they want are
called "open-source licenses" and are the entire bases of open-source software.

There is also the slightly different idea of "free software" ("free" as in "freedom")
which is a set of open-source licenses that require any other projects that use
your code to *also* be under a free software license.
This is called "viral licensing" and is something you should probably be aware
of for when looking at other people's code or libraries.

### ASCII & Unicode

Computers only understand numbers. Anything other than a number must itself be
represented in numbers somehow. So when it comes to text the solution seems
obvious: Give every letter or symbol a number. This mapping of numbers ->
symbols is called a "character encoding".

Back in the day there were many *many* character encodings. Hundreds of them.
This was a disaster. Every written language had its own encoding, and most had several
of them. If you tried to open a file that was in a different encoding than yours
it would show up completely garbled.

The most common/important character encoding was ASCII, which could only handle
the Latin alphabet and the most common symbols. Basically what you see on a
standard US keyboard. Perhaps the biggest oddity of ASCII was that it is only
7-bit. It defines only 128 characters of the 256 possible using one full byte.
This extra bit, and the space for characters it provides, was *itself* used in
a variety of different and incompatible purposes.

So in the 90s everybody got together and created Unicode as a single character
encoding for all languages. It's even compatible with ASCII! (thanks to that extra bit)
Unicode has many advanced features, and is actually fairly complicated.

Unicode is made up of *code points* which can be multiple bytes long, unlike
ASCII where every character is a single byte. A code point doesn't always make
up a visible character, they can also be various *control characters* or even
refer to nothing at all if the code point hasn't been assigned. A single
character (also called a *glyph* or *grapheme*) can be made up of multiple code
points. Because of things like this calculating the length of a string can
sometimes be a complex task.

### Machine Code, Compiling, and Interpreting

Despite the menagerie of different programming languages out there, the CPU in
your computer can actually only understand one variety of instructions: *machine code*.
The infamous *assembly* languages are human-readable version of machine
code. All programming languages (including assembly) must somehow be converted
to this machine code, and there are a variety of techniques to do so.

The difference between various CPU "architectures" is what kind of instructions
that CPU supports, and translating from one set to another is a tricky process
known as "cross compiling" that I recommend avoiding at all costs to save
yourself a big headache.

The most common techniques for translating source code into machine code are
*compiling* and *interpreting* (there are other ways too). Most languages only
support only one or the other, though they sometimes offer ways to fake it. The
phrases "systems language" and "scripting language" are sometimes used to
referred to compiled or interpreted languages, respectively.

When compiling you use a program that takes your source code and translates it
into machine code "ahead-of-time" before it is run. This usually means that your
program is much faster, but development can sometimes be slowed since you need
to compile then run every time. Compiled languages include: C, Go, Rust, etc.

When interpreting you use a program that takes your source code and reads it,
then the interpreter program (which was almost certainly written in a compiled
language) will do something based on what your code said to do. While this means
your program often runs slower, it is usually faster to write and should run on
all the architectures the interpreter supports. Interpreted languages include:
Python, Ruby, JavaScript, etc.

Assembly is a bit different, it is *assembled* into machine code. We use this
phrase to differentiate it from compiling, since compiling also includes
optimization and *linking* chunks of code from different places together, while
assembling is a straight translation.

## Glossary of other Terms

In addition to the key concepts and topics above, I want to quickly go through
some other terms. This is a short list, so if you encounter something new then I say
for the umpteenth time: Look it up.

- `conditional`: A section of code that will only run under some condition
- `loop`: A section of code that will run repeatedly
- `program`: See `application`, though I often use as "any piece of code"
- `source code`: The original code written by the programmer
- `library`: A piece of software that is intended to be used in *other* projects
- `application`: The end piece of software that a user interacts with
- `package`: See `library`
- `argument`: A value that is passed to a function when it is called, and that will become a variable inside that function. Word describes both the value passed in and the variable inside
- `refactoring`: Making large changes to the existing structure of a program
- `concatenation`: Taking two things (usually strings or arrays) and combining them one after the other
- `overloading`: Multiple functions with the same name, but different arguments. Most languages intentionally do not support this because it's confusing, but there are some notable exceptions
- `declare`: To create a variable or function and make its name usable. Often where you set its type if applicable
- `assign`: To set the value of a variable after (or during) declaration
- `undefined variable`: A variable that has been *declared* but not *assigned*
- `commit`: A single set of submitted changes in a VCS
- `call`: To run the code contained within a function at the place where it is called
- `substitute`: To use a variable in an expression, where its name is "substituted" for its value
- `recursion`: A function that calls itself, forming a loop
- `exception`: A common way of reporting errors
- `syntax`: The keywords and symbols that form a language
- `text editor`: The program you use to edit source code
- `IDE`: "Integrated Development Environment", a text editor with many more features geared towards editing a specific language
- `hack`: A piece of ugly code that abuses some aspect of the language or structure to do something. Not to be confused with "hacking", which often involves exploiting hacks
- `pseudo-code`: Code that's not actually correct syntax, but expresses the idea. Often used when just designing or talking about something
- `lambda calculus`: A branch of math focused only on functions and pure logic
- `Von Neumann machine`: The name of the general design of common computers with a CPU and RAM and a hard drive
- `a11y`: Shorthand for "accessibility" (also a neat pun)
- `i18n`: Shorthand for "internationalization"
- `l11n`: Shorthand for "localization"
