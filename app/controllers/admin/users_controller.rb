class Admin::UsersController < ApplicationController
	def top
	end
	def index
		@user = User.all
	end
end
