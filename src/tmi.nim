import net, parseopt
from os import sleep

type ConnectionDetails* = ref object
  channel : string
  nick    : string
  pass    : string

proc parseMessage(buf: string): string =
  var
    afterName : bool
    colons    : int
    n         : int
    name      : string
    msg       : string

  for i, c in buf:
    if not afterName and c == '!':
      afterName = true
    if c == ':' and colons < 2:
      colons += 1
      n = i
    if i > n:
      if not afterName and colons == 1:
        name &= c
      if colons == 2:
        msg &= c

  result = name & ": " & msg


proc login(sock: Socket, con: ConnectionDetails) =
  sock.send(con.pass)
  sock.send(con.nick)
  sock.send(con.channel)

proc setChannel(sock: Socket; con: var ConnectionDetails, chan: string) =
  con.channel = "JOIN #" & chan & "\r\n"
  login(sock, con)

proc pingpong(sock: Socket, buf: var string) =
  buf = sock.recvLine()
  if buf == "PONG :tmi.twitch.tv":
    sock.send("PONG :tmi.twitch.tv")
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PONG'd"


when isMainModule:
  var
    buf: string
    socket = newSocket()
    con = ConnectionDetails(channel : "JOIN #brucegreene\r\n",
                            nick    : "NICK GargantuanPhallus\r\n",
                            pass    : "PASS oauth:nq7fyr8b0b6u3xsyd15d5irp3bgkkf\r\n")

  socket.connect("irc.chat.twitch.tv", Port(6667))
  socket.login(con)
  while true:
    socket.pingpong(buf)
    echo parseMessage(buf)
    sleep(20)
