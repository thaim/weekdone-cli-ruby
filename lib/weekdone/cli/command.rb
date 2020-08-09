require 'thor'
require 'weekdone'

module Weekdone::Cli
  class Command < Thor
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


    desc "searchForItems", "search for items"
    method_options userid: :string
    def searchForItems
      client = Weekdone::Api.new(nil, nil)
      File.open(ENV['HOME'] + "/.weekdone/credentials", "r") do |f|
        @token_code = f.gets(client.token_code)
      end
      client.token_code = @token_code

      items = client.searchForItems(user_id: options[:userid])
      print JSON.dump(items)
    end
  end
end
