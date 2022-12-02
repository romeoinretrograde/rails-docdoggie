class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @doggie = @user.doggie
    @days_together = (Time.now - @doggie.created_at).to_i / 86_400
  end

  def profile
  end

  def calendar
  end
end
