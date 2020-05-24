require "rails/generators/active_record"

module ActiveAdmin
  module History
    module Generators
      class InstallGenerator < Rails::Generators::Base
        include ActiveRecord::Generators::Migration
        source_root File.join(__dir__, "templates")

        def copy_migration
          migration_template "admin_action_migration.rb", "db/migrate/create_admin_actions.rb", migration_version: migration_version
        end

        def migration_version
          "[#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}]"
        end
      end
    end
  end
end