module Fastlane
  module Actions
    class XcovReportAction < Action
      def self.run(params)
        UI.message("The xcov_report plugin is working!")
        require "erb"
        require 'json'

        file = File.read(File.expand_path('coverage/report.json'))
        data = JSON.parse(file)
        @coverage = data['coverage']
        @targets = data['targets']
        template = '---
layout: coverage
---
<div class="coverage">

<div class="row">
    <div class="col-md-20">
        <h2>Coverage</h2>
    </div>
    <div class="col-md-4 text-right">
        <h2 class="text-right"><%= (@coverage * 100).round(2) %>%</h2>
    </div>
</div>
    <% cont = 0 %>
    <% @targets.each do |value| %>
        <div class="row targets">
            <div class="col-md-20">
                <h4><%= value["name"] %></h4>
            </div>
            <div class="col-md-4 text-right">
                <h4><%= (value["coverage"] * 100).round(2) %>%</h4>
            </div>
        </div>
        
        <% value["files"].each do |file| %>
        <% cont = cont + 1 %>
                    <ol class="list-items">
                        <li class="list-items-row">
                            <div data-toggle="collapse" aria-expanded="false" data-target="#list-item-line-<%= cont %>">
                                <div class="row">
                                    <div class="col-md-2 col-md-offset-2">
                                        <i class="glyph glyph-add"></i>
                                        <i class="glyph glyph-remove"></i>
                                    </div>
                                    <div class="col-md-8">
                                        <a><%= file["name"] %></a>
                                    </div>
                                    <div class="col-md-6">
                                        <%= file["type"] %>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <%= (file["coverage"] * 100).round(2) %>%
                                    </div>
                                </div>
                            </div>
                    
                            <div class="collapse" id="list-item-line-<%= cont %>">
                                <% file["functions"].each do |function| %>
                                    <div class="row functions">
                                        <div class="col-md-18 col-md-offset-2">
                                        <%= function["name"] %>
                                        </div>
                                        <div class="col-md-4 text-right">
                                            <%= (function["coverage"] * 100).round(2) %>%
                                        </div>
                                    </div>
                                <% end %>
                            </div>
                        </li>
                    </ol>
        <% end %>
    <% end %>
</div>
        '
    
        renderer = ERB.new(template)
        result = renderer.result(binding())

        open('coverage/index.html', 'w') do |f|
          f.puts result
        end

      end

      def self.description
        "Generate custom HTML for coverage"
      end

      def self.authors
        ["Gianfranco Manganiello"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Generates an HTML based on JSON generated from xcov"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "XCOV_REPORT_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
