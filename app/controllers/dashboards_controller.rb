class DashboardsController < ApplicationController
  def go_to_home
    if user_signed_in?
      redirect_to dashboard_path
    else
      redirect_to new_user_session_path
    end
  end
end
