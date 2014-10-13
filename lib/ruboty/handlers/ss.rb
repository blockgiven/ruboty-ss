module Ruboty
  module Handlers
    class Ss < Base
      on %r{ss (?<url>http(?:s?)://.*)}, name: 'screenshot', description: 'take a screenshot'

      def screenshot(message)
        Ruboty::Ss::Actions::TakeScreenshot.new(message).call
      end
    end
  end
end
