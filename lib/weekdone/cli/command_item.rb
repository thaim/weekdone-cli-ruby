require 'thor'
require 'weekdone'
require 'logger'

require_relative 'base'
require_relative 'credential'
require_relative 'output'

module Weekdone::Cli
  class Item < Thor
    include Weekdone::Cli

    desc "search", "search for items"
    method_options userid: :string
    def search
      client = build_client

      items = client.searchForItems(user_id: options[:userid])
      Credential.write_credential(client.token_hash)
      Output.format(items, format: :json)
    end


    map 'get-comments' => 'getComments'
    desc "get-comments", "get item comments"
    option :itemid, type: :string, required: true
    def getComments
      client = build_client

      comments = client.getItemComments(options[:itemid])
      Credential.write_credential(client.token_hash)
      Output.format(comments, :json)
    end
  end
end
