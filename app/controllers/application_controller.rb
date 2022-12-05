class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    if user.doggie.nil?
      new_doggy_path(user)
    else
      dashboard_path(user)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def user_root_path
    dashboard_url
  end
end
