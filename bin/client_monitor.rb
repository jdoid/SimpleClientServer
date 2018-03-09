require 'socket'

hostname = 'localhost'
port = 2200

# deal with arguments
if ARGV.length > 0
  hostname = ARGV[0]
  $stdout.flush
else
  hostname = "localhost"
end

# open socket to server
s = TCPSocket.open(hostname, port)

# print to std out what comes across socket
while line = s.gets
  puts line.chomp
end

s.close