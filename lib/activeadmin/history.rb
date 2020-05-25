require "activeadmin/history/version"

module ActiveAdmin
  module History
    extend ActiveSupport::Concern

    class Error < StandardError; end

    def self.included(dsl)
      dsl.controller do
        after_action :create_admin_action, only: [:create, :update, :destroy]

        def create_admin_action
          if action_name == 'create'
          end

          ::AdminAction.create(
            admin_user_id: current_admin_user.id,
            object_id: resource.id,
            object_type: resource.class.to_s,
            object_params: params.dig(resource.class.to_s.underscore.to_sym),
            action: params[:action],
          )
        end
      end
    end
  end
end
