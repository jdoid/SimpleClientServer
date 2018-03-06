require 'socket'

port = 2200
server = TCPServer.open(port)

$cli = lambda { |command| command }

def write_to_file
  open('status.out', 'a') do |f|
    File.foreach('sys_commands').with_index do |line|
      f.puts ($cli.call(`#{line}`))
      f.puts
    end
  end
end

def send_status
  File.foreach('status.out').with_index do |line|
      $client.puts(line)
    end
end

loop {
  $client = server.accept
  
  $client.puts(Time.now.ctime)
  $client.puts
  
  File.delete "status.out"
  write_to_file
  send_status
  

  $client.close
}