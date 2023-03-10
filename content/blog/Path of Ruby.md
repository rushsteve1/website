+++
title = "Path of Ruby"
date = 2019-08-14
+++

I have somewhat decided to contribute to the [Ruby programming
language](https://www.ruby-lang.org/en/) as my project for the Open Source
course at RPI. With that I have decided to record my path to doing so in the
hopes that others may find it useful.

I will be continually updating this post as I make progress, so stay tuned!

## Around May 20, 2019

I started learning about Ruby on my own, before learning about the project in
Open Source, since I had heard good things about the language and wanted to see
if I liked it better than Python. The answer of course was "yes" I do like it
much more than Python. It has a lot of niceties and really feels like a lot of
thought and care was put into it.

I greatly enjoy the full everything-is-and-object approach instead of Python's
half-baked way of doing things. And the syntax is better. I need to dig in some
more into using the language but so far I like it.

Started working my way through the [Ruby Koans](http://rubykoans.com/) which was
a fairly interesting and good way to learn the syntax and subtleties of the
language. I would recommend this to anyone who wants to learn Ruby as a good way
to get used to the language.

## Jun 07, 2019 - Jun 08, 2019

The start of my journey! Cloned down the [Ruby git
repo](https://github.com/ruby/ruby) and subscribed to the mailing list as well
as started looking through the Ruby issue tracker. I like their general
work-flow.  While the `ruby-core` mailing list does have a lot of activity, much
more development seems to happen on the issue tracker. An issue is opened and
then a patch is made and attached to it.

[This page](https://www.ruby-lang.org/en/community/ruby-core/) was a good place
to get started and it's good that Ruby has it.

## Jun 09, 2019

Finished up the Koans today.I liked them and thought it was a great way to
learn. I wish more languages had something like this, a practical hands-on way
to learn.

## Jun 25, 2019

Presented my idea to work on Ruby in the Open Source class and a few other
people seemed interested in joining me. So that's good I won't be going this
alone.

Also I have realized that the `ruby-core` mailing list is just spamming updates
from the bug-tracker. So it might not be the most useful thing to be subscribed
to.

## Jul 13, 2019

I started a new little side project in an attempt to learn more Ruby and the
Ruby ecosystem: A website where you can view and vote on how good the anime
dubs.

It's a relatively simple website but it's a good exercise. When I started I was
going to use Ruby on Rails but that was far more complex and powerful than what
I needed so I looked into Sinatra and was **very** impressed! Sinatra uses the
DSL features of Ruby to create a really powerful and easy to use system for
creating a web backend. It's lightweight but provides exactly the features I
needed, and each time I wanted something I found that Sinatra already had it and
integrated it nicely.

## Jul 26, 2019

Today we had our Interim Presentation to the class. We spoke about all the
things we did, which was mostly learning about how Ruby works both as a language
and as a piece of software, and the things we want to accomplish. Namely that we
all want to get a patch in.

Oh, on that note, since I was feeling motivated and was digging around the bug
tracker I [found an easy first bug and submitted a
patch!](https://bugs.ruby-lang.org/issues/15244) So I have officially begun the
process of contributing to the Ruby programming language! It's a very simple
patch, only 2 lines (diff below) but it's a start!

```diff
diff --git a/file.c b/file.cindex 0742c52d66..1e35839903 100644--- a/file.c+++ b/file.c@@ -4686,7 +4686,7 @@ ruby_enc_find_extname(const char *name, long *len, rb_encoding *enc)
 	do name = ++p; while (isdirsep(*p));

     e = 0;
-    while (*p && *p == '.') p++;+    if (*p && *p == '.') p++;    /* Only trim the first leading period */     while (*p) {
 	if (*p == '.' || istrailinggarbage(*p)) {
 #if USE_NTFS
diff --git a/spec/ruby/core/file/extname_spec.rb b/spec/ruby/core/file/extname_spec.rbindex 7632b6adc0..d9fbb9ea3e 100644--- a/spec/ruby/core/file/extname_spec.rb+++ b/spec/ruby/core/file/extname_spec.rb@@ -22,6 +22,7 @@     File.extname("....").should ==  ""
     File.extname(".foo.").should ==  ""
     File.extname("foo.").should ==  ""
+    File.extname("...jpg").should == ".jpg"   end

   it "returns only the last extension of a file with several dots" do
```

## Aug 02, 2019

So since the patch I submitted the patch a week ago I haven't gotten any on the
issues page so I set out to the `#ruby` IRC channel on Freenode and started
seeing if I could get someone to review it and hopefully merge it. I got one
person to provide some feedback, but no luck getting a hold of anyone who can
merge it.

One of the other people that was working on Ruby with me in the Open Source
course, Gabe, has also started getting rolling. He found himself an issue that
he wants to work on and has started coding away. He has been having issues with
compiling all of Ruby though so we'll see if we can get that fixed before moving
forward.

## Aug 12, 2019

Began more seriously rewriting my old [Discord quote
bot](https://gitlab.com/rushsteve1/quote-bot/) in Ruby. This bot has a
reputation among my friends and they should be glad to have it back.  And a few
of my friends have expressed interest in helping me out with it so that could be
really fun and a good learning experience.

## Aug 13, 2019

Progress on the patch front! Someone added a comment to my bug and an additional
modified patch to address the equivalent issue in the `basename` function as
well. Gabe also managed to get his patch wrapped up and submitted [over
here](https://bugs.ruby-lang.org/issues/15609).  His patch is much more involved
so it took much longer for him to finish it.

## Aug 14, 2019

Last day of the summer semester and the last day of the Open Source Software
course. That means it's also time for our final presentations. [Ours can be
found here](https://cloud.rushsteve1.us/index.php/s/WzQxzgis6nWFX29) as a
Markdown file.

This has been a fun adventure and has given me more confidence when jumping into
large older projects. If I could do it all again though I might pick a different
project, to have a different experience. Maybe Thunderbird next time...
