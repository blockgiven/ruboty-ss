require 'mem'
require 'jsonism'
require 'yaml'

module Ruboty
  module Ss
    module Storage
      class Gist
        include Mem

        def initialize
          raise "Ruboty::Ss::Storage::Gist doesn't work"
        end

        def upload(image_file, path)
          files =
            {
              path => {
                content: Faraday::UploadIO.new(image_file.path, 'image/png')
              }
            }
          gist_client.create_gist(files: files)
        end

        private

        def gist_client
          client = Jsonism::Client.new(schema: gist_schema)

          def client.connection
            Faraday.new(url: base_url) do |connection|
              connection.request :multipart
              connection.request :url_encoded
              connection.response :json
              connection.adapter :net_http
            end
          end

          client
        end
        memoize :gist_client

        def gist_schema
          schema_path = File.expand_path('../../../../vendor/r7kamura/json-collection/github/schema.yml', __dir__)
          YAML.load_file(schema_path)
        end
        memoize :gist_schema
      end
    end
  end
end
