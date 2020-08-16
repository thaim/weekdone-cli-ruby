require 'thor'
require 'weekdone'

require_relative 'command_item'

module Weekdone::Cli
  class Command < Thor
    def self.exit_on_failure?
      true
    end

    desc "login", "oauth login to weekdone"
    def login
      client_id = ENV['WEEKDONE_CLIENT_ID']
      client_secret = ENV['WEEKDONE_CLIENT_SECRET']

      client = Weekdone::Api.new(client_id, client_secret)
      puts "open URL to authorize:"
      puts client.authorization_request

      print "\ninput authorization code: "
      auth_code = STDIN.gets.chomp
      client.authorization_grant(auth_code)

      File.open(ENV['HOME'] + "/.weekdone/credentials", "w") do |f|
        f.puts(client.token_code)
      end
    end

    register(Item, 'item', 'item [COMMAND]', 'command for item')
  end
end
