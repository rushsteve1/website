+++
title = "Keyboard Build Log"
date = 2022-01-03
[taxonomies]
category = ["hardware"]
tags = ["keyboard", "mk"]
+++

## The Planck
Due to the unfortunate accident of having a bit too much pocket money, I decided
to embark on the journey of building a keyboard. And I didn't want to build just
any keyboard, I wanted something specifically able to be used for
[Stenotype](https://en.wikipedia.org/wiki/Stenotype)
with [Plover](http://www.openstenoproject.org/plover/).

So off I went down the rabbit hole of ortholinear keyboards. Eventually I
settled on getting a [Planck](https://olkb.com/collections/planck).
The small size seemed fun, it's hotswap which I wanted since I
can't solder and I wasn't in the mood to <del>make horrible mistakes</del> *learn*, and
the price seemed good.
I picked one up [from Drop.com](https://drop.com/buy/planck-mechanical-keyboard)
(I wish they'd kept the name "Massdrop") with
a red HiPro case since that's what was in stock and I liked the red. It arrived
about 10 days later. I can only assume this was just holiday shipping backups,
since it came from only about 2 hours away.

<div style="display:flex;flex-flow:row wrap;">
<img src="https://repo.rushsteve1.us/attachdownload/Imagepipe_50.jpg?page=Keyboard+Build+Log&file=Imagepipe_50.jpg" title="Planck box with Knife for scale" />
<img src="https://repo.rushsteve1.us/attachdownload/Imagepipe_51.jpg?page=Keyboard+Build+Log&file=Imagepipe_51.jpg" title="The Planck red HiPro case in the box with Knife for scale" />
</div>

## Switches and Caps

So on to the next problem: It doesn't come with Switches. Meaning I need to
decide on switches.

<center>***Cue the crippling indecision.***</center>

As any keyboard fan knows, choosing switches isn't a simple matter. It's
basically a lifestyle choice. So to aid in this I decided to pick up the [21
switch sampler pack from Drop.com](https://drop.com/buy/assorted-mechanical-mx-switches-sampler-pack)
as well. Because I was dumb I didn't order this at the same time as my Planck,
so it came a couple of days later.
After trying them all I came to really like the Kailh Box switches. They're
really nice and clicky, and very stable. Up until now I thought that I didn't
like clicky switches, but I now realize that I don't really like Cherry Blues.

![Assembled Planck with 21 sampler Switches](https://repo.rushsteve1.us/attachdownload/Imagepipe_52.jpg?page=Keyboard+Build+Log&file=Imagepipe_52.jpg)

Following much waffling I eventually settled on
[Kailh Box White switches from MechanicalKeyboards.com],(https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=4114),
since I loved the Box Jade and Navys that came in the sampler pack that I
got, but I wanted something a little bit lighter. Hopefully they live up to my
expectations, it was quite harrowing to order a switch I hadn't specifically tried.
For a while I was also highly interested in the
[Kailh Choc lineup of switches](https://mechanicalkeyboards.com/shop/index.php?l=product_list&c=862)
but unanswered questions about low-profile switches and the discovery of
compatibility issues with my Planck rendered those a no-go. My Box Whites only took 3 days to arrive, so were quite quick.

<div style="display:flex;flex-flow:row wrap;">
<img src="https://repo.rushsteve1.us/attachdownload/Imagepipe_56.jpg?page=Keyboard+Build+Log&file=Imagepipe_56.jpg" title="Bag of Kailh Box White switches" />
<img src="https://repo.rushsteve1.us/attachdownload/Imagepipe_55.jpg?page=Keyboard+Build+Log&file=Imagepipe_55.jpg" title="Planck with switches" style="object-fit:contain" />
</div>

In addition to deciding on switches, I also had to pick out keycaps to go over
those switches. This was of course *another* point of crippling indecision that
happened in parallel to the switches. Together deciding on both took me over
a week.
I ended up going with
[PimpMyKeyboard F10 keycaps](https://pimpmykeyboard.com/f10-flat-keys/)\
because I liked the flat square shape, and they seemed like they would go
very well with an ortho-linear keyboard and seemed reasonably comfortable
for Stenotype, where you have to press multiple keys with one finger at the
same time. I ordered 30 white caps and 20 red ones, with plans for a neat
pattern.
It took a bit over a week for them to arrive, and spent most of that lost by
USPS. But they did eventually find it, just when I was starting to get annoyed too.

And so now, without further ado, the grand finale...

![The finished keyboard with keycaps](https://repo.rushsteve1.us/attachdownload/Imagepipe_57.jpg?page=Keyboard+Build+Log&file=Imagepipe_57.jpg)

## QMK Firmware

The Planck uses the popular [QMK Firmware](https://qmk.fm), and is actually
one of the keyboards that QMK was originally made for. QMK is intended to be
extremely customizable and extensible in C. It took me a little while to get all
setup and figured out with QMK, mostly my own fault for trying to do it in a container
but once I figured out the right `udev` rules I was off! You can see
[my custom firmware here in the repo](https://repo.rushsteve1.us/dir?ci=tip&name=qmk-planck).
I expect to iterate on this for a while until I'm completely happy with it.

Now that everything is done, and my keyboard is all set and ready for Stenography,
it's time to start the long process of learning to use it!
