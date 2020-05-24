require "activeadmin/history/version"

module ActiveAdmin
  module History
    extend ActiveSupport::Concern

    class Error < StandardError; end

    def self.included(dsl)
      dsl.controller do
        before_action :create_admin_action, only: [:create, :update, :destroy]

        def create_admin_action
          ::AdminAction.create(
            admin_user_id: current_admin_user.id,
            action: params[:action],
          )
        end
      end
    end
  end
end
