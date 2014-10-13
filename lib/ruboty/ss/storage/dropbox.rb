require 'dropbox_sdk'
require 'mem'
require 'open-uri'

module Ruboty
  module Ss
    module Storage
      class Dropbox
        include Mem

        def upload(image_file, options)
          response = client.put_file(options[:path], image_file)
          sleep 0.5 # FIXME
          shares = client.shares(response['path'])
          sleep 0.5 # FIXME
          uri = OpenURI.open_uri(shares['url'])
          URI.join(uri.base_uri.to_s, '?dl=1').to_s
        rescue => e
          e.message
        end

        def access_token
          ENV['RUBOTY_SS_DROPBOX_ACCESS_TOKEN']
        end

        def client
          DropboxClient.new(access_token)
        end
        memoize :client
      end
    end
  end
end
