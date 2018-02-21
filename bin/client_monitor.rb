require 'socket'

hostname = 'localhost'
port = 2200

# deal with arguments
if ARGV.length < 1
  print "Host name | IP : "
  hostname = gets.chomp
  $stdout.flush
else
  hostname = ARGV[0]
end

# open socket to server
s = TCPSocket.open(hostname, port)

# print to std out what comes across socket
while line = s.gets
  puts line.chomp
end

s.close
