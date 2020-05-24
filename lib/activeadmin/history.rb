require "activeadmin/history/version"

module ActiveAdmin
  module History
    extend ActiveSupport::Concern

    class Error < StandardError; end

    def self.included(dsl)
      dsl.controller do
        puts "Inside the controller."
        def update
          puts "Inside the update action."
          super
        end
      end
    end
  end
end
