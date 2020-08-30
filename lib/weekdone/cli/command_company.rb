require 'thor'
require 'weekdone'
require 'logger'

require_relative 'base'
require_relative 'credential'
require_relative 'output'

module Weekdone::Cli
  class Company < Thor
    include Weekdone::Cli

    desc "info", "get company info"
    def info
      client = build_client

      info = client.getCompanyInfo
      Credential.write_credential(client.token_hash)
      Output.format(info, format: :json)
    end
  end
end
