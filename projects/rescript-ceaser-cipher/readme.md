# rescript-ceaser-cipher

👋 My first ReScript project! I wanted to immedietly apply the fundamentals of ReScript to a fun cyptography project. I tried to comment everything in my code so you can follow along with my thought process.

## Getting started

This is a web project! Feel free to clone this and run `pnpm i` to install the necessary packages.

Then run `pnpm start` to start a dev-server.

If you want to run ReScript's build step in watch mode then run `pnpm rescript:watch`.

I think it's a good idea to journal some of my initial thoughts, pros, and cons of ReScript while doing these projects so here goes:

### Initial thoughts

- Building the "algorithm" to do the ciphering shouldn't be too bad.
- Interfacing with the web API may be difficult if ReScript does not provide typings for it.
- I shouldn't need a module bundler.

### Pros

- After writing the "algorithm" that converts encrypts/decrypts text, it immedietly worked without any unexpected bugs.
- I didn't have to think about types all to much (I was actually impressed by how much the language was able to infer by itself).
- The data-matching/switch pipelines are actually OP.
- Standard libraries are a bit weird at first but somewhat cleaner to use in my opinion (whatever that means).

### Cons

- So it turns out that there isn't a native typings for the DOM API so I had to psuedo-inject my own types.
- I had to sometimes use the ` %raw(``)% escape to write raw JS into my ReScript to do what should be basic things like  `modulo`and`parseInt()`
- I really struggled when it came to curried-functions and trying to prevent that from happening by default (the concept of it is a bit weird to me, this is defintely something I will be looking into soon).

### Some takeaways

- It took me way longer to build this than I had anticipated (instead of 2-3 hours, it took 2-3 days).
- The documentation for ReScript feels complete yet not complete at the same time, certain features of the language like functions and typing them are well-documented but other aspects like how to use the standard libraries are not.
- This may be on me coming from a non-functional programming background but some of the syntax seems odd to me such as always having to use a standard library to do basic operations on arrays. I'm used to `array.[method]` but ReScript expects me to use `Js.Array.[method]`, which is fine but I did run into some troubles with chaining methods.
