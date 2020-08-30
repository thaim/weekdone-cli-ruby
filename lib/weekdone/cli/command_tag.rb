require 'thor'
require 'weekdone'
require 'logger'

require_relative 'base'
require_relative 'credential'
require_relative 'output'

module Weekdone::Cli
  class Tag < Thor
    include Weekdone::Cli

    desc "list", "get all tags"
    def list
      client = build_client

      tags = client.getAllTags
      Credential.write_credential(client.token_hash)
      Output.format(tags, format: :json)
    end

    desc "get", "get single tag"
    option :tagid, type: :numeric, required: true
    def get
      client = build_client

      tag = client.getSingleTag(options[:tagid])
      Credential.write_credential(client.token_hash)
      Output.format(tag, format: :json)
    end
  end
end
