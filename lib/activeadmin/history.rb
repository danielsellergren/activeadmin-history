require "activeadmin/history/version"

module ActiveAdmin
  module History
    extend ActiveSupport::Concern

    class Error < StandardError; end

    def self.included(dsl)
      dsl.controller do
        before_action :before_admin_action, only: [:create, :update, :destroy]
        after_action :after_admin_action, only: [:create, :update, :destroy]

        def before_admin_action
          @admin_user_id = current_admin_user.id
          @action = params[:action]
          @param_attributes = params.dig(controller_name.singularize.to_sym)
          @object_diff = nil

          if @action == 'update'
            @object_diff = diff(resource, resource.class.new(@param_attributes.to_unsafe_hash))
          end

          @admin_action = ::AdminAction.create(
            admin_user_id: @admin_user_id,
            action: @action,
            object_params: ActiveSupport::JSON.encode(@param_attributes),
            object_diff: ActiveSupport::JSON.encode(@object_diff),
          )
        end

        def after_admin_action
          @admin_action.update(
            object_id: resource.id,
            object_type: resource.class.to_s,
          )
        end

        private

        def diff(resource_a, resource_b)
          h = {}
          resource_a.attributes.each_pair do |key, value|
            if resource_a.respond_to?(key) && resource_b.respond_to?(key)
              unless %w[id created_at updated_at].include?(key)
                value_a = resource_a.send(key)
                value_b = resource_b.send(key)
                
                if value_a != value_b
                  h[key] = [value_a, value_b]
                end
              end
            end  
          end    
          h
        end
      end
    end
  end
end
