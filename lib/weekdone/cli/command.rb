require 'thor'
require 'weekdone'

require_relative 'command_item'
require_relative 'command_tag'
require_relative 'command_objective'
require_relative 'command_company'

module Weekdone::Cli
  class Command < Thor
    def self.exit_on_failure?
      true
    end

    desc "login", "oauth login to weekdone"
    def login
      client = build

      puts "open URL to authorize:"
      puts client.authorization_request

      print "\ninput authorization code: "
      auth_code = STDIN.gets.chomp
      client.authorization_grant(auth_code)

      Credential.write_credential(client.token_hash)
    end

    register(Item, 'item', 'item [COMMAND]', 'command for item')
    register(Tag, 'tag', 'tag [COMMAND]', 'command for tag')
    register(Objective, 'objective', 'objective [COMMAND]', 'command for objective')
    register(Company, 'company', 'company [COMMAND]', 'command for company')
  end
end
