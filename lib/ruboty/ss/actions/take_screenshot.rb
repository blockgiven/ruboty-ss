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
            message.reply("スクショとれなかったっしょ")
            return
          end

          if url = upload(image_file)
            message.reply(url)
          end
        end

        def image_file
          Tempfile.open(%w(tempfile .png)) do |file|
            output = Phantomjs.run(SCREENSHOT_SCRIPT, message[:url], file.path)
            unless output.include?('FAIL')
              file
            end
          end
        end
        memoize :image_file

        def image_path
          # TODO: extract to host/path/to/url/date.png
          "#{Time.now.to_s}.png"
        end

        def upload(image_file)
          storage_class.new.upload(image_file, path: image_path)
        end

        def storage
          ENV['RUBOTY_SS_STORAGE'] || 'gyazo'
        end

        def storage_class
          Ruboty::Ss::Storage.const_get(storage.dup.tap {|s| s[0] = s[0].upcase })
        end
      end
    end
  end
end
