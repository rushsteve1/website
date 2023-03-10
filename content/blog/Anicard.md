+++
title = "Anicard"
date = 2018-04-05
+++

A project that I have been working on for the last couple of months has come to fruition. Yes, for once, I actually completed a side project! Check it out [here in the repo](https://repo.rushsteve1.us/dir?ci=tip&name=anicard).

It is in three major parts:

`kitsu.rs` is a library used to pull from [Kitsu](https://kitsu.io). This library is actually not mine but I contributed to it and it is a big part of the project. Big thanks to [@zeyla](https://github.com/zeyla) the maintainer.

`anicard` is a library that generates nice looking summary cards for anime and manga using the data it got from `kitsu.rs`. This is the most important part of the project and took the longest.

`anicard-rocket` wraps around `anicard` and provides a nice frontend using [Rocket](https://rocket.rs)

Overall it was a fun project. I got to work more with [Rust](https://rust-lang.org) it's whole ecosystem which I continually find more and more pleasant. Of course I still have my share of fighting the borrow checker, but I have found that promotes good practices and increases code quality. And when it doesn't it is easy (if less efficient) to just `.clone()` and keep going.

Things of note:

- When using Rocket in a Docker container specify:

```
ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=8080 #Or whatever
ENV ROCKET_ENV=prod
```

- Kitsu changes their API a lot. And breaks it's own conventions.
- Serde is amazing and the `Value` enum is magical.

### Edit 1:
After getting some feedback from friends I showed it too I spent a couple of days implementing some new features. There is now a "similar results" section in case you typed something wrong, or wanted something slightly different.
Also cleaned up the UI and added a footer and the title. The best minor feature is OpenGraph support, so now you get a nice little preview when posting the link on social media.
