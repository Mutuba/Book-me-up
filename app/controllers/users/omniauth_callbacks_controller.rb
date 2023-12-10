# # app/controllers/users/omniauth_callbacks_controller.rb
# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
#   def google_oauth2
#     @user = User.from_omniauth(request.env['omniauth.auth'])

#     if @user.persisted?
#       sign_in_and_redirect @user, event: :authentication
#     else
#       session['devise.google_data'] = request.env['omniauth.auth']
#       redirect_to new_user_registration_url
#     end

#     # Access token
#     access_token = request.env['omniauth.auth'].credentials.token
#     # Now you can use 'access_token' to make requests on behalf of the user.
#   end
# end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_omniauth(auth)
    if user.persisted?
      sign_out_all_scopes
      request.env['omniauth.auth'].credentials.token
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      flash[:alert] =
        t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end


  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end