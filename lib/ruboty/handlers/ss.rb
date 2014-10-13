module Ruboty
  module Handlers
    class Ss < Base
      # FIME: move envs to ruboty/ss/storage/*.rb
      env :RUBOTY_SS_STORAGE, 'storage provider for ruboty-ss. (default: dropbox)', optional: true
      env :RUBOTY_SS_DROPBOX_ACCESS_TOKEN, 'dropbox access token.', optional: true #fixme

      on %r{ss (?<url>http(?:s?)://.*)}, name: 'screenshot', description: 'take a screenshot'

      def screenshot(message)
        Ruboty::Ss::Actions::TakeScreenshot.new(message).call
      end
    end
  end
end
