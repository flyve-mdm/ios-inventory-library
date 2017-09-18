module Fastlane
  module Helper
    class XcovReportHelper
      # class methods that you define here become available in your action
      # as `Helper::XcovReportHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the xcov_report plugin helper!")
      end
    end
  end
end
