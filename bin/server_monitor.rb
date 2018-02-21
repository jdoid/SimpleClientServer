require 'socket'

port = 2200
server = TCPServer.open(port)

$cli = lambda { |command| command }

def execute
  File.foreach('sys_commands').with_index do |line|
      $client.puts($cli.call(`#{line}`))
      $client.puts
    end
end

loop {
  $client = server.accept
  
  $client.puts(Time.now.ctime)
  $client.puts
  
  execute

  $client.close
}
