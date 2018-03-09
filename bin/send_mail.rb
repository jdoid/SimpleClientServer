require 'net/smtp'
require 'json'


# Credit for original logic for this script goes to Jerod Santo - 
#   https://jerodsanto.net/2009/02/a-simple-ruby-method-to-send-emai/
#
# Update: 03/06/2018


class SendEmail

  attr_accessor :to, :server, :from, :from_alias, :subject, :body 

  def initialize
    @config_file = "./config.json"
  end
  
  def get_config
    file = File.open(@config_file, "r")
    read_json = file.read
    file.close
    parsed = JSON.parse(read_json)
    
    @to = parsed['to']
    @server = parsed['server']
    @from =  parsed['from']
    @from_alias =  parsed['from_alias']
    @subject =  parsed['subject']
    @body =  parsed['body']
  end

  def send(to,opts={})
    get_config
    
    opts[:to]          ||= @to
    opts[:server]      ||= @server
    opts[:from]        ||= @from
    opts[:from_alias]  ||= @from_alias
    opts[:subject]     ||= @subject
    opts[:body]        ||= File.read(@body)

    message = <<END_OF_MESSAGE
From: #{opts[:from_alias]} <#{opts[:from]}>
To: <#{to}>
Subject: #{opts[:subject]}

#{opts[:body]}
END_OF_MESSAGE

    Net::SMTP.start(opts[:server]) do |smtp|
      smtp.send_message message, opts[:from], to
    end
  end

  def send_email
    #send_email "jdean@fastmail.us", :body => "Server Status:  "
    send
  end

end