class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user.admin?
      flash[:notice] = "Hello! #{current_user.first_name} #{current_user.last_name}"
      admin_tests_path
    else
      tests_path
    end    
  end

end
