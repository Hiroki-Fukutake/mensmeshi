class ApplicationController < ActionController::Base
	before_action :store_user_location!, if: :storable_location?
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!, except: [:index]


	def after_sign_up_path_for(resource)
		front_post_images_path
	end
	def after_sign_in_path_for(resource)
		front_post_images_path
	end
	def after_sign_out_path_for(resource)
		root_path
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :email, :password, :password_confirmation])
	end

	private

	def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end

end
