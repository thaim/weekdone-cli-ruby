require 'thor'
require 'weekdone'

require_relative 'command_item'
require_relative 'command_tag'
require_relative 'command_objective'
require_relative 'command_company'

module Weekdone::Cli
  class Command < Thor
    include Weekdone::Cli

    def self.exit_on_failure?
      true
    end

    desc "login", "oauth login to weekdone"
    def login
      client = build_client

      puts "open URL to authorize:"
      puts client.authorization_request

      print "\ninput authorization code: "
      auth_code = STDIN.gets.chomp
      client.authorization_grant(auth_code)

      Credential.write_credential(client.token_hash)
    end

    desc "report", "get report"
    def report
      client = build_client

      report = client.getReport
      Credential.write_credential(client.token_hash)
      Output.format(report, format: :json)
    end

    desc "teams", "get all teams"
    def teams
      client = build_client

      teams = client.getAllTeams
      Credential.write_credential(client.token_hash)
      Output.format(teams, format: :json)
    end

    desc "users", "get all users"
    def users
      client = build_client

      users = client.getAllUsers
      Credential.write_credential(client.token_hash)
      Output.format(users, format: :json)
    end

    desc "types", "get all types"
    def types
      client = build_client

      types = client.getAllTypes
      Credential.write_credential(client.token_hash)
      Output.format(types, format: :json)
    end


    register(Item, 'item', 'item [COMMAND]', 'command for item')
    register(Tag, 'tag', 'tag [COMMAND]', 'command for tag')
    register(Objective, 'objective', 'objective [COMMAND]', 'command for objective')
    register(Company, 'company', 'company [COMMAND]', 'command for company')
  end
end
