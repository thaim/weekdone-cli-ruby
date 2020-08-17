require 'thor'
require 'weekdone'
require 'logger'

require_relative 'credential'
require_relative 'output'

module Weekdone::Cli
  class Item < Thor
    desc "search", "search for items"
    method_options userid: :string
    def search
      client = Weekdone::Api.new(nil, nil, loglevel: Logger::DEBUG)
      client.token_code = Credential.read_credential

      items = client.searchForItems(user_id: options[:userid])
      Output.format(items, format: :json)
    end


    map 'get-comments' => 'getComments'
    desc "get-comments", "get item comments"
    option :itemid, type: :string, required: true
    def getComments
      client = Weekdone::Api.new(nil, nil)
      client.token_code = Credential.read_credential

      comments = client.getItemComments(options[:itemid])
      Output.format(comments, :json)
    end
  end
end
