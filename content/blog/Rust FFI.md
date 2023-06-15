+++
title = "Getting started with Rust FFI"
date = 2019-02-15
[taxonomies]
category = ["programming"]
tags = ["rust"]
+++

> **UPDATE 2022:** This is now rather outdated, but still might be accurate. Your mileage may vary.

[Rust](https://rust-lang.org) is a fantastic systems level programming language
known for it's memory safety and painless concurrency. But as a relatively new
language it can sometimes lack mature libraries for various tasks.

One common way to solve that is to use Foreign-Function-Interfaces (FFI) to call
code from another language, usually C. This lets us leverage the existing
ecosystem of C relatively easily.

That's the idea anyway. In reality, the memory models of Rust and C can often
cause a lot of friction. This guide is born out of my own personal struggles
writing [`transmission-sys`](https://crates.io/crates/transmission-sys) a
wrapper for the Transmission BitTorrent client.

Though in this guide we will go over the much simpler example of writing a
wrapper for [`libevent-sys`](https://crates.io/crates/libevent-sys) the code for
which can be [found here](https://gitlab.com/tornado-torrent/libevent-sys).
**Make sure that you have `libevent-dev` or equivalent installed on your
system!**

BindGen
-------

Normally speaking when interacting with C code it is necessary to manually write
bindings in Rust to the C library as [detailed in the Rust
Book](https://doc.rust-lang.org/book/ch19-01-unsafe-rust.html#using-extern-functions-to-call-external-code).
The official [Rust BindGen](https://crates.io/crates/bindgen) crate takes that
load off of us the programmer and instead does it automatically. While the
[BindGen Guide](https://rust-lang.github.io/rust-bindgen/) serves as a good
introduction to the tool it fails to highlight some important points.

1.  BindGen is not the one-stop-shop for wrapping a C library. The library still
    needs to be linked into the Rust binary.
2.  BindGen has a number of important features that are not discussed in the
    guide, such as Rustified Enums.
3.  The Guide says nothing about fixing many common problems stemming from
    wrapping C code.

While the [BindGen docs](https://docs.rs/bindgen/0.47.1/bindgen/) help with the
second point the first and third are left for the reader to figure out. But
don't worry I'll cover them here! But first things first...

### Build Dependencies

Cargo, the Rust package manager, supports marking dependencies as only necessary
during the build process using the `[build-dependencies]` field. To add BindGen
add the following to our `Cargo.toml`.

```toml
[build-dependencies]
bindgen = "0.47.1"
```

Make sure to use the most up-to-date version available [on
Crates.io](https://crates.io/crates/bindgen).

### wrapper.h

A simple but important step is creating the `wrapper.h` file. This is a normal C
header file that `#include`s all the headers for the C code that we want to
generate bindings for. This header can also contain whatever other alterations
to the C definitions we need.

For now `wrapper.h` should contain

```c
#include <event.h>
```

### Build.rs

The next step in using BindGen is creating the `build.rs` file. This file is
often called the "build script" and is a Rust file that will run before
compilation and allows us to perform custom actions during the build. In this
case we will be generating the bindings. [The Cargo book has good documentation
on build scripts.](https://doc.rust-lang.org/cargo/reference/build-scripts.html)

We will be adding to this file over the rest of guide, but for `build.rs` should
contain the following.

```rust
use std::path::PathBuf;
use std::env;
use bindgen;

fn main() {
    let bindings = bindgen::Builder::default()
        // Set what header file to use
        .header("wrapper.h")
        .rustfmt_bindings(true)

        // Fixes a bug with a duplicated const
        .blacklist_item("IPPORT_RESERVED")
        // Generate the bindings in memory
        .generate()
        .expect("Failed to generate bindings");

    // Find the path to the output directory
    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
    bindings
        // Write the bindings out to a file
        .write_to_file(out_path.join("bindings.rs"))
        .expect("Failed to write bindings");
}
```

Notice how similar the build script is to a standard Rust program? That's
because it _is_ one! Build scripts can perform anything a normal Rust program
can, so can be used to orchestrate complex tasks.

Getting the C in
----------------

Ok we have our bindings created, but the problem is that we don't actually have
the C code in our library. BindGen doesn't do the linking for us (a fact that
took me a week to realize).

We also need to inform Cargo that our crate links in external code. To do this
[we need to add two
keys](https://doc.rust-lang.org/cargo/reference/build-scripts.html#the-links-manifest-key)
to the `cargo.toml`. A `links` field with the name of the library we are linking
(without "lib" in front) and a `build` pointing to our `build.rs` file. In the
case of `libevent-sys` this looks like this.

```toml
links = "event"
build = "build.rs"
```

There are a number of ways that we can go about linking in the C libraries, each
with their own use cases.

### Basic Linking

To link a library already installed on our system is actually fairly simple, we
just have to add a single line in our build script. For `libevent` that line
would look like this.

```rust
println!("cargo:rustc-link-lib=event");
```

However this built-in method, while easy, is somewhat brittle. What happens when
`libevent` is not installed, or there are multiple versions?

#### pkg-config

The [`pkg-config`](https://crates.io/crates/pkg-config) solves both of these
problems. It uses the system's `pkg-config` tool to locate the library and link
it. This is what we used in `libevent-sys`. To use `pkg-config` add it to our
`Cargo.toml` in the `[build-dependencies]` field like this.

```toml
[build-dependencies]
bindgen = "0.47.1"
pkg-config = "0.3.14"
```

Then add the following to our `build.rs`. We can also specify more advanced
options, and I suggest reading the [`pkg-config`
docs](https://docs.rs/pkg-config/0.3.14/) if you need to specify a version or
path.

```rust
// Goes at the top with the other use statements
use pkg_config;
...
// Goes in the main() function
pkg_config::probe_library("libevent")
	.expect("Unable to find libevent");
```

Now `libevent` is linked into our Rust library. For many simple or system
libraries we are now done and can use the new library! But keep reading, because
there are a number of other things to consider when using FFI.

### Custom Builds

When linking a library that is not installable on the system, or when we need to
apply custom patches or features we want to be able to compile and link C source
code. This is entirely possible and there are a few crates to help us do this.
Note that these crates only compile the code, and we will still need to link it
and create bindings using the steps above.

#### cc (formerly gcc)

The `[cc](https://crates.io/crates/cc)` [crate](https://crates.io/crates/cc)
(formerly called `gcc`) provides an easy interface into a C compiler, allowing
us to build code into a static library which can then easily link it into our
Rust code. The [documentation for the tool](https://docs.rs/cc/1.0.29/) is
extensive and it supports C and C++ (though I personally discourage the use of
C++ and Rust FFI as it is complex and difficult)

#### cmake

The [`cmake` crate](https://crates.io/crates/cmake) offers a convenient way to
use the Cmake build system from build scripts. If the code you are linking uses
Cmake I highly suggest using this crate to make the process of building much
more streamlined. I suggest taking a look [at the
examples](https://docs.rs/cmake/0.1.35/cmake/#examples) to get started.

This is also what we used in
`[transmission-sys](https://gitlab.com/tornado-torrent/transmission-sys)` so
take a look at that if you want to see a more complex real-world example.

Using The New Library
---------------------

Now we have a Rust library that wraps an existing C library. But how do we
actually use it. The first step is [adding our library as a Cargo
dependency](https://doc.rust-lang.org/cargo/guide/dependencies.html). In the
case of `libevent-sys` we just add the following to `Cargo.toml`.

```toml
[dependencies]
libevent-sys = "0.1.2"
...
```
### unsafe

Rust has an extremely strict memory safety model. And C... has no memory safety
model at all. This means that anything in the Rust library is considered unsafe
by extension. The Rust Book has a [Chapter on
Unsafety](https://doc.rust-lang.org/book/ch19-01-unsafe-rust.html) which is very
helpful. But as a general rule of thumb all code from this library must be used
in an `unsafe { }` block.

This inherit unsafety is the reason we called the crate `libevent-sys`. The
"-sys" denotes that this crate contains the raw bindings and is the one that is
actually linked to the C code. Many projects also offer a secondary crate
providing safe and ergonomic Rust bindings.

### Pointers

Rust _has_ pointer types `*const T` and `*mut T` and even a [module to interact
with them](https://doc.rust-lang.org/std/ptr/index.html).

**Never use them.**

If a pointer needs to last more than a few lines (past the end of the `unsafe`
block is a good rule) it should be wrapped in a
[`NonNull`](https://doc.rust-lang.org/std/ptr/struct.NonNull.html). This is a
much safer wrapper for pointers and guarantees that the pointer isn't null and
allows us to get multiple references to the internal object, and just generally
manage the pointer better without having to de-reference it. Note that `NonNull`
like pointers themselves are not thread-safe, but more on that later.

By the way Rust references are automatically coerced into pointers. This means
that if a function asks for a pointer `*const var` we can instead pass `&var`.
This allows the borrow checker to properly do it's job and helps ensure memory
safety. Mutable pointers and references are also automatically coerced into
their `const` versions if necessary.

### repr c

Rust and C use different memory layouts for structs. So when passing a Rust
struct to C remember to add the `#repr(C)` macro flag to the struct like this.

```rust
#repr(C)
struct Foo {}
```
### Concurrency

One problem with FFI is that any struct containing a pointer or `NonNull` is no
longer considered thread-safe. Since Rust places such a high priority on
multi-threaded programs this can present a real problem. But thankfully there is
a way to manually declare a struct as thread safe.

```rust
struct NonThreadSafe {
	ptr: NonNull<other>
}

unsafe impl std::marker::Send for NonThreadSafe {}
unsafe impl std::marker::Sync for NonThreadSafe {}
```

This causes the struct `NonThreadSafe` which contains a `NonNull` to be manually
considered thread-safe.

**However this doesn't actually make `NonThreadSafe` thread-safe, it merely
tells the compiler not to check.**

In order to be properly thread safe I suggest wrapping the `NonNull` a
[`Mutex`](https://doc.rust-lang.org/std/sync/struct.Mutex.html) or an
[`RwLock`](https://doc.rust-lang.org/std/sync/struct.RwLock.html) or similar.
This barrier to access provides a great deal more protection against
race-conditions and other nasty effects.

Further Considerations
----------------------

Just because your library wraps the C code and compiles doesn't mean that there
isn't anything left to do. There can be numerous other things to consider, with
the following being what I think are some of the most important or easiest to
trip over.

### Docs.rs

[Docs.rs](https://docs.rs) automatically generates documentation for all the
packages on [Crates.io](https://crates.io) and serves them with a consistent
UI/UX. It is a great resource for both us as programmers and the community in
general.

Often times, such as the case of `transmission-sys`, if we have a very complex
build script Docs.rs will be unable to build the documentation. This can be very
frustrating to users of a library, but thankfully is easily fixed using [Cargo
feature
flags](https://doc.rust-lang.org/cargo/reference/manifest.html#the-features-section).

By creating a specific feature flag for Docs.rs we can skip the parts of the
build script that it has trouble with. To do this first add a new feature to our
`Cargo.toml`. In this case I named mine `docs-only`.

```toml
[features]
docs-only = []
```

Then in our build script we can use the `cfg!` macro to check if the flag is
enabled and do things based on that. Make sure however to leave BindGen
otherwise it will not create documentation for the generated code.

```rust
// Check if docs-only is enabled
let docs = cfg!(feature = "docs-only");
// Don't run the problematic code if it is
if !docs {
    // Code we don't want to run
}
// BindGen generation
```

One final step is to configure Cargo to set this feature flag when running on
Docs.rs. This can be done by adding the following to `Cargo.toml`

```toml
[package.metadata.docs.rs]
features = [ "docs-only" ]
no-default-features = true
all-features = false
```

I highly suggest doing this when you have a more complex build script involving
things like `cmake`. Check out the [`transmission-sys` build
script](https://gitlab.com/tornado-torrent/transmission-sys/blob/master/build.rs)
for an example.

### BindGen flags

Rust BindGen also supports a [number of other configuration
flags](https://docs.rs/bindgen/0.47.1/bindgen/struct.Builder.html) when
generating the bindings. Some of the more useful include:

*   [`rustfmt_bindings`](https://docs.rs/bindgen/0.47.1/bindgen/struct.Builder.html#method.rustfmt_bindings)
    which calls [`rustfmt`](https://github.com/rust-lang/rustfmt) on the
    generated bindings causing them to be much more readable. Requires `rustfmt`
    to be installed.
*   [`default_enum_style`](https://docs.rs/bindgen/0.47.1/bindgen/struct.Builder.html#method.default_enum_style)
    and
    [`rustified_enum`](https://docs.rs/bindgen/0.47.1/bindgen/struct.Builder.html#method.rustified_enum)
    causes C enums to be generated as Rust enums instead of as a series of
    constants.
*   [`raw_line`](https://docs.rs/bindgen/0.47.1/bindgen/struct.Builder.html#method.raw_line)
    lets us insert Rust code directly into the bindings.

And many more listed in the docs linked above. Read them carefully, because many
can make the library significantly easier to use, or fix bugs when generating
the bindings.

### Unit Tests

It is suggested by the BindGen guide that you write some basic sanity tests for
generated libraries and I wholeheartedly second this. One problem with using the
BindGen approach is that code will compile successfully that completely does not
work. This is how I had a totally non-functional library for a week without
realizing

So write some basic unit tests for common actions the library will provide. At
very least check that some important constants are properly set and accessible
to ensure that everything linked.

### Static Linking

Frequently instead of having external dependencies it is very useful to
statically link them in. Both ways of linking I detailed above make this fairly
trivial.

If you used the built-in `println!` method then simply add `static=` like this.

```rust
println!("cargo:rustc-link-lib=static=event");
```

Using `pkg-config` is a little trickier because we need to use the
[expanded](https://docs.rs/pkg-config/0.3.14/pkg_config/struct.Config.html)
`[Config](https://docs.rs/pkg-config/0.3.14/pkg_config/struct.Config.html)`
[form](https://docs.rs/pkg-config/0.3.14/pkg_config/struct.Config.html) instead
of the shorter version we used before. But is still relatively easy, with the
`libevent` example looking like this.

```rust
pkg_config::Config::new()
	.atleast_version("2.0.0")
	// This is what toggles linking statically or not.
	.statik(true)
	.probe("libevent")
	.expect("Unable to find libevent");
```
### Include and Exclude

When using the manual approach with `cc` or `cmake` we often might have our C
code in Git or as a submodule. When doing this make sure to add the [`include`
or `exclude`
field](https://doc.rust-lang.org/cargo/reference/manifest.html#the-exclude-and-include-fields-optional)
to `Cargo.toml` to make sure you are only keeping the files that you need and
don't accidentally inflate the size of your crate.

Thanks for Reading!
-------------------
