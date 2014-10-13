require 'gyazo'
require 'mem'

module Ruboty
  module Ss
    module Storage
      class Gyazo
        include Mem

        def upload(image_file, options)
          "#{client.upload(image_file.path)}.png"
        rescue => e
          e.message
        end

        private

        def client
          ::Gyazo::Client.new
        end
      end
    end
  end
end
