+++
title = "Working on a Mac"
date = 2020-03-30
[taxonomies]
category = ["hardware"]
tags = ["mac"]
+++

For the last few months, ever since I started my current internship in late
January, I have been using a Mac at work. This may seem like a fairly minor and
common occurrence, but this is the first time that I have ever used a Mac for
more than a few minutes, and the first time I have ever had to develop on and
for an Apple device.

Specifically I have used two devices:

- 2013 Mac Pro (the old Trashcan one)
- 2017 Macbook Pro

The switch was due to issues that I had with the Mac Pro, which I'll get to in a
minute.

For comparison my own personal devices are a custom desktop PC and a [Lenovo
Thinkpad
T470s](https://www.lenovo.com/us/en/laptops/thinkpad/thinkpad-t-series/ThinkPad-T470s/p/22TP2TT470S).
Both are running [OpenSUSE Tumbleweed](https://opensuse.org) with [KDE
Plasma](https://kde.org), and I am very happy with them both.

## 2013 Mac Pro

I actually rather liked this machine. It was compact, quiet, and very powerful.
Technically in the scheme of Macs it's on the dated side, but it worked
wonderfully for my needs.

But there was one problem: It crashed. Increasingly so. At first it was once a
week (strangely usually on Wednesday) but then it was suddenly three times in
one day and it was impeding my productivity enough that it had to be replaced.

I never did figure out *why* it was crashing. Part of me thinks it was
overheating, but I never found proof of that. The system log just said that the
system just... crashed.

## 2017 Macbook Pro

After the Trashcan started crashing more than I could work around, I switched it
out for this machine, which the IT department apparently had lying around. My
coworkers were actually quite enthusiastic about this switch, with those who
used the same machine calling it "wonderful" and such.

To be honest I liked the Trashcan more, even with the crashes.

Both machines have poor thermals, but on the Macbook this is a much larger
problem since it is a fairly thin laptop. The fan curve has Apple's seemingly
signature style, where it seems to only exist in "off" and "full blast" states.
Even with that the machine gets hot to the touch and thermal-throttles easily.

Battery life is also rather mediocre, but I give it a pass since this is a
second-hand machine that has seen heavy use, so the battery has likely degraded
to some extent.

The screen is pretty nice. Though the color profile is a bit cold for my taste.
I've tried fiddling with this in the settings, but I could make neither heads
nor tails of the various color profiles available.

Having only 2 USB-C ports and a headphone jack is one of the signature traits of
modern Mac laptops. As a casual observer I considered this annoying, but I
didn't really internalize just how much of a problem this really is. I cannot
plug in Ethernet or a mouse without a dongle, which I don't have, and plugging
the laptop in to charge takes up a whole port. Which when there are only two is
a big problem.

Not to mention that one of the two ports on this laptop ceased working. It can
accept power... but that's it. It will not output to a display or otherwise
perform any of the things one usually expects from a USB port.

And finally, last and certainly least, is the keyboard. The infamous Butterfly
Keyboard.

I can't say I like it. To be honest I think I would prefer having no keyboard
and at all and typing on a flat touch-screen. The Butterfly keyboard is exactly
the right depth to be awful. The keys are entirely unsatisfying to press, there
is no tactile feedback other than the *thwack* of the key bottoming out after a
millimeter or so. It is simply unpleasant and uncomfortable to type on. I pine
for the long travel and tactile bump of my Thinkpad.

## MacOS

MacOS (or OSX) itself is actually quite nice. The general desktop is consistent
and well thought out, the settings are flexible and allow for a good amount of
customization.

And the default applications are fantastic. Some like Mail and Calendar are
exactly what I think a pre-installed application should be. Simple, consistent,
and well integrated with the rest of the system. Finder is also very nice,
powerful and with a lot of great features.

Spotlight is a key feature of MacOS, and it's something I've come to use very
heavily. I'm thankful for Krunner on KDE Plasma since that mirrors it so
closely.

Overall I would describe MacOS as a very well put together operating system on
the surface level. It is probably the best desktop-tailored OS available.
However I am still a Linux fanboy at heart, but that's just me.

## Developing on a Mac

Developing on a Mac is generally an... alright experience. It's not as nice as
developing on Linux, but it's a *lot* better than developing on Windows.

[Homebrew](https://brew.sh) is a capable package manager, and I have relatively
few complaints about it. I have not tried [MacPorts](https://www.macports.org/)
or [Nix](https://nixos.org/nix/) on MacOS yet, and I honestly don't have much
reason to other than curiosity.

Having a proper terminal and shell experience out-of-the-box is quite nice, and
[iTerm2](https://iterm2.com/) is a very good terminal emulator as well. The
choice of [ZSH](http://zsh.org/) as the default shell for MacOS Catalina and on
is an interesting one, but I always switch to [FISH](https://fishshell.com/)
anyway.

The trouble only starts when you are trying to develop *for* MacOS. Apple's
vendor lock-in means that attempting to build for MacOS on anything other than a
MacOS device is an exercise in futility. And it constantly seems like if you're
not using XCode then the system is fighting you. And as an
[Emacs](https://www.gnu.org/software/emacs/) user this is... frustrating.

## Verdict

If you've made it this far, thanks for reading. This has rambled on for quite a
while...

Overall I find using and developing on a Mac to be a reasonably good
experience, and one that I am content with seeing that it's a workplace-mandated decision.

But compared to developing on and for a Linux or BSD machine, it's just not as
pleasant. But of course that may just be my personal bias. I've been a full-time
Linux user for years now, and I've gotten very comfortable with it.
