require 'should'
io = require('socket.io-client')

socketURL = 'http://0.0.0.0:5000'

options = 
  transports: ['websockets']
  'force new connection':true

chatUser1 = name:'Tom'
chatUser2 = name:'Sally'
chatUser3 = name:'Dana'

describe "Chat Server", ->
  it "Should broadcast new user to all users", (done) ->
    client1 = io.connect(socketURL, options)
    client1.on "connect", (data) ->
      client1.emit "connection name", chatUser1
      client2 = io.connect(socketURL, options)
      client2.on "connect", (data) ->
        client2.emit "connection name", chatUser2

      client2.on "new user", (usersName) ->
        usersName.should.equal chatUser2.name + " has joined."
        client2.disconnect()

    numUsers = 0
    client1.on "new user", (usersName) ->
      numUsers += 1
      if numUsers is 2
        usersName.should.equal chatUser2.name + " has joined."
        client1.disconnect()
        done()


