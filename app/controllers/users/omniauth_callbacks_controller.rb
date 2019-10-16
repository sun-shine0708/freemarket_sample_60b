class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.omniauth_data"] = request.env["omniauth.auth"].except("extra")
      render "/signups/user1"
    end
  end

  def failure
    redirect_to root_path and return
  end
end