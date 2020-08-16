module Weekdone::Cli
  class Credential
    def self.read_credential
      File.open(ENV['HOME'] + "/.weekdone/credentials", "r") do |f|
        @token_code = f.gets
      end

      @token_code
    end
  end
end
