class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
  before_action :authenticate_user!
=======

>>>>>>> c34bf14203ec2d0ffd63793b25467fb69284098e
end
