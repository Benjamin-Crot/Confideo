class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :is_professionnal, :photo])

      # For additional in app/views/devise/registrations/edit.html.erb
      # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    if current_user.is_professionnal && !Profile.exists?(user_id: current_user.id)
      new_profile_path
    else
      root_path
    end
  end

  def change_date(old_date)
    str = 'old_date'
    @date = Date.strptime(str, '%Y-%m-%d')
    @date.strftime('%d-%m-%Y')
  end

  helper_method :change_date
end
