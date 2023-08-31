class HomeController < ApplicationController
  before_action :require_authentication, except: :index

  def index
  end

  private

  def require_authentication
    redirect_to new_user_session_path unless current_user
  end

  # protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      aeroplanes_path
    # else
    #   search_path
    end
  end
end
