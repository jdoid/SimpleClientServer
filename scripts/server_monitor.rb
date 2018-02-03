require 'socket'

server = TCPServer.open(16201)

cli = lambda { |command| command }

loop {
  client = server.accept
  client.puts(Time.now.ctime)
  client.puts

   # users logged in
  client.puts(cli.call(`users`))
  client.puts

  # Minecraft server status
  client.puts(cli.call(`msm server list`))
  client.puts

  # Plex server running
  client.puts(cli.call(`ps -ef | grep "Plex Media Server" | grep -v grep`))
  client.puts

  client.close
}
