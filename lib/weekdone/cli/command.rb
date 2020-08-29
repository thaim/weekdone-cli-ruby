require 'thor'
require 'weekdone'

require_relative 'command_item'
require_relative 'command_objective'

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

      Credential.write_credential(client.token_hash)
    end

    register(Item, 'item', 'item [COMMAND]', 'command for item')
    register(Objective, 'objective', 'objective [COMMAND]', 'command for objective')
  end
end
