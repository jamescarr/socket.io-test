# Testing Socket.IO with Mocha
This is the result of me following the excellent blog post by Liam
Kaufman on [Testing Socket.IO With Mocha, Should.js and Socket.IO
Client](http://liamkaufman.com/blog/2012/01/28/testing-socketio-with-mocha-should-and-socketio-client/)
and redoing the examples in coffeescript.

## Getting It
Git clone instructions

## Running It

First start the server up

```bash
coffee chat-server.coffee
```

Then run the tests
```bash
mocha -R spec

```

## Notes
I've tagged my work at each stage of the blog post

* first-test
* second-test
* refactor-no-more-manual-work
* third-test

After passing the second test I refactored so I no longer had to start
and stop the server outside of my tests.


I also make an abusive use of preinstall hooks in npm to fetch and
install the latest snapshot of socket.io-client from github.


