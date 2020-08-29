module Weekdone::Cli
  class Credential
    def self.read_credential
      File.open(ENV['HOME'] + "/.weekdone/credentials", "r") do |f|
        @credential = JSON.parse(f.gets)
      end

      @credential
    end

    def self.write_credential(token_hash)
      File.open(ENV['HOME'] + "/.weekdone/credentials", "w") do |f|
        f.write(token_hash.to_json)
      end
    end
  end
end
