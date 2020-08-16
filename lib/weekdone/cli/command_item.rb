require 'thor'
require 'weekdone'

require_relative 'credential'

module Weekdone::Cli
  class Item < Thor
    desc "search", "search for items"
    method_options userid: :string
    def search
      client = Weekdone::Api.new(nil, nil)
      client.token_code = Credential.read_credential

      items = client.searchForItems(user_id: options[:userid])
      print JSON.dump(items)
    end


    map 'get-comments' => 'getComments'
    desc "get-comments", "get item comments"
    option :itemid, type: :string, required: true
    def getComments
      client = Weekdone::Api.new(nil, nil)
      client.token_code = Credential.read_credential

      comments = client.getItemComments(item_id: options[:itemid])
      print JSON.dump(comments)
    end
  end
end
