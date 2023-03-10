+++
title = "One Day Challenge: Fakeout"
date = 2020-03-09
+++

One of the first real programming projects I ever did, and certianly one of the
first that anyone actually used was a a simple message board I called "Faker".
This was way back in highschool, and it was a big hit among my friends.

Code is [in the repo here](/dir?ci=tip&name=knowhere-cafe/fakeout)

Now years later I have come a long way as a programmer, and as a challenge to
myself I have decided to re-make it, this version I am calling "Fakeout".

This project had two main goals:

1. To refresh myself on VueJS.
2. To (re)learn Google Firebase.

The original version of this site, Faker, was written in Angular 2 and used
Firebase as the backend, back when Firebase was effectively only a cloud
database provider.

Fakeout is also using Firebase, but has upgraded to the newer Cloud Firestore.
And since I have come to like VueJS quite a bit over the
years so I wanted to refresh myself on that since it had been a while.

The project overall went well and I succeeded in my challenge to create the site
in a day. Users can create text posts, comment on them, and posts can be tagged.

At first I had Vuex as a dependency but I realized that I didn't need it and
wasn't using it since I was constantly just using the database itself as the
store. It may be an idea to add caching using Vuex, but that is out of the scope
of the challenge.

Overall this challenge was pretty simple since I have had quite a bit of
web-development experience at this point, but as always there are loads of
corner cases that I didn't think of.
Notably my friend wanted to post ASCII art and we found that it would break
formatting. A quick use of `<pre>` later and it worked.

This was a fun idea though, and I might challenge myself like this some more.
