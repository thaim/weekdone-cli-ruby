require 'thor'
require 'weekdone'
require 'logger'

require_relative 'credential'
require_relative 'output'


module Weekdone::Cli
  class Objective < Thor

    desc "list", "get all objectives"
    option :type, type: :string
    option :departmentid, type: :numeric
    option :teamid, type: :numeric
    option :userid, type: :numeric
    option :period, type: :string
    def list
      client = Weekdone::Api.new(nil, nil)
      client.token_hash = Credential.read_credential

      params = {}
      params[:type] = options[:type] if not options[:type].nil?
      params[:departmentid] = options[:departmentid] if not options[:departmentid].nil?
      params[:teamid] = options[:teamid] if not options[:teamid].nil?
      params[:userid] = options[:userid] if not options[:userid].nil?
      params[:period] = options[:period] if not options[:period].nil?

      objectives = client.getAllObjectives(params)

      Credential.write_credential(client.token_hash)
      Output.format(objectives, format: :json)
    end

    desc "comments", "list objective comments"
    def comments
      client = Weekdone::Api.new
      client.token_hash = Credential.read_credential

      params = {}
      params[:type] = options[:type] if not options[:type].nil?
      params[:departmentid] = options[:departmentid] if not options[:departmentid].nil?
      params[:teamid] = options[:teamid] if not options[:teamid].nil?
      params[:userid] = options[:userid] if not options[:userid].nil?
      params[:period] = options[:period] if not options[:period].nil?

      objectives = client.getAllObjectives(params)
      Credential.write_credential(client.token_hash)
      Output.format(objectives, format: :json)
    end
  end
end
