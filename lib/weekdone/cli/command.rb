require 'thor'

module Weekdone::Cli
  class Command < Thor
    desc "hello", "Say hello"
    def hello
      puts "hello"
    end
  end
end
