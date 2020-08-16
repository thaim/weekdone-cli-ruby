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


    map 'get-comment' => 'getComment'
    desc "getComment", "get item comments"
    option :userid, type: :string, required: true
    def getComment
      client = Weekdone::Api.new(nil, nil)
      client.token_code = Credential.read_credential

      comments = client.getItemComments(user_id: options[:userid])
      print JSON.dump(comments)
    end
  end
end
