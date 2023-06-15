+++
title = "One Day Challenge: SSIF"
date = 2020-03-09
[taxonomies]
category = ["programming"]
tags = ["rust"]
+++

This is my second One Day Challenge that I have done for myself, and I think a
far more interesting challenge than the previous. Since I had some time while I
was on vacation I decided to take on a project that I had been thinking of for a
while: I designed and implemented an image format in a day.

Steve's Simple Image Format or `SSIF` for short is a basic binary image format
with a reference encoder and decoder written in Rust. I chose Rust because I
love the language and thing that it us suitably low-level for such a task.
Notably my implementation is entirely in safe Rust, as it should be.

The code can be found [in the repo](/dir?ci=tip&name=SSIF), with the specification for the image
format in the `README.md` file.

I acutally really liked this project and it is something that I may come back
to. I'm quite proud of my design, with SSIF supporting some nice features like a
basic form of compression.

When I started I didn't even plan to write the encoder, only the decoder, but
after getting going I found myself writing both and even implementing the
compression system into the encoder.

While I do think that the code still needs some work, I am particularly proud of
the decoder, which leverages higher-order programming and the `itertools` crate
to perform the decoding in one chain iterator functions.

I am thinking of coming back to this project and adding some more tools, and
probably a basic SSIF view viewer or BMP import/export.
