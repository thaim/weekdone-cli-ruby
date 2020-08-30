require 'weekdone'

require_relative 'credential'

module Weekdone::Cli
  def build_client
    client_id = ENV['WEEKDONE_CLIENT_ID']
    client_secret = ENV['WEEKDONE_CLIENT_SECRET']

    client = Weekdone::Api.new(client_id, client_secret)

    token_hash = Credential.read_credential
    client.token_hash = token_hash if not token_hash.nil?

    client
  end
end
