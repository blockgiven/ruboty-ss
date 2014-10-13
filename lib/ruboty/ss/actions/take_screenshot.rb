require 'mem'
require 'phantomjs'

module Ruboty
  module Ss
    module Actions
      class TakeScreenshot < Ruboty::Actions::Base
        include Mem

        SCREENSHOT_SCRIPT = File.expand_path('../../../../scripts/screenshot.js', __dir__)

        def call
          unless image_file
            message.reply("@#{message.from_name} スクショとれなかったっしょ")
            return
          end

          res = upload(image_file)
          # TODO: build message from response
        end

        private

        def image_file
          Tempfile.open(%w(tempfile .png)) do |file|
            output = Phantomjs.run(SCREENSHOT_SCRIPT, message[:url], file.path)
            unless output.include?('FAIL')
              file
            end
          end
        end
        memoize :image_file

        def upload(image_file)
          # TODO: upload to gist
        end
      end
    end
  end
end
