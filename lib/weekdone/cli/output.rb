require 'logger'

module Weekdone::Cli
  class Output
    class << self
      def format(data, format: :json, loglevel: Logger::DEBUG)
        @@logger = Logger.new(STDERR)
        @@logger.level = loglevel

        if format == :json
          @@logger.debug("print in json format")
          print data
        elsif format == :text
          @@logger.debug("print in text format")
          formatText(data)
        end
      end

      def formatText(data)
        print data
      end
    end
  end
end
