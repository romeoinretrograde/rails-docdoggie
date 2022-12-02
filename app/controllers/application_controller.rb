class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def user_root_path
    dashboard_url
  end
end
