module Ruboty
  module Handlers
    class Ss < Base
      # FIME: move envs to ruboty/ss/storage/*.rb
      env :RUBOTY_SS_STORAGE, 'storage provider for ruboty-ss. (default: gist)', optional: true

      on %r{ss (?<url>http(?:s?)://.*)}, name: 'screenshot', description: 'take a screenshot'

      def screenshot(message)
        Ruboty::Ss::Actions::TakeScreenshot.new(message).call
      end
    end
  end
end
