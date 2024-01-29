class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :authenticate_user!

  def redirect_access_denied
    redirect_to root_path, alert: "you are not authorized to access this resource!"
  end

end
