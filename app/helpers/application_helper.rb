module ApplicationHelper
	def simple_time(time)
	time.strftime("%Y-%m-%d %H:%M ")
	end

	def resource_name
   		:user
	end

	def resource
	   @resource ||= User.new
	end

	def devise_mapping
	   @devise_mapping ||= Devise.mappings[:user]
	end
end
