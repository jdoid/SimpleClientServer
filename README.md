# SimpleClientServer

This is a very simple Ruby client/server to check up on my Linux server(s) status. The client is terminal based. The sever_monitor.rb runs in a loop waiting to execute a list of pre-defined commands that are listed in the sys_commands file.  

## Tested Platform

* Ubuntu Server 16.04.3 LTS (xenial)
* Ubuntu Server 14.04.5 LTS (trusty)
* ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]

## Files

#### bin/client_monitor.rb

This file is executed from either the server or another server/client on the network. If desired edit file and change socket value for the client / server connection.

port = 2200
      
#### bin/server_monitor.rb

This file along with sys_commands file live in the same directory on the server that is to report output from the list of     commands in the sys_command file. If desired edit file and change socket value for the client / server connection.

port = 2200
	
#### bin/sys_commands

Edit this file to include the commands you want to be executed. Treat each line in the file as a separate command to be executed on a Linux command line, including pipes, regular expressions, etc.

## Getting Started
#### Server

Edit sys_commands file as described in section “Files”. Copy files server_monitor.rb and sys_commands to a directory on the reporting server.
Example location:  /home/<user>/bin/server_monitor.rb /home/<user>/bin/sys_commands
			
	$ cd /home/<user>/bin
	$ ruby server_monitory.rb &

#### Client

You can execute client_monitor.rb on the same server or from another server on the same network.  For crob friendly usage there is no prompt for hostname and 'localhost' is the default host.  One IP address or hostname can be added as a single command line option. See examples:
	
  	$ ruby client_monitor.rb			
  	$ ruby client_monitory.rb 192.168.1.10

## Bugs and Feedback

For bugs, questions and discussions please use the [GitHub Issues](https://github.com/jdoid/SimpleClientServer/issues).
