io = require("socket.io").listen(5000)
io.sockets.on "connection", (socket) ->
  socket.on "connection name", (user) ->
    io.sockets.emit "new user", user.name + " has joined."

  socket.on 'message', (msg) ->
    io.sockets.emit 'message', msg
