class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth']
    # Redirect to the URL you want after successfull auth
    binding.pry

    redirect_to '/dashboard'
  end

  def failure
    # show a failure page or redirect to an error page
     @error_msg = request.params['message']
  end

  def set_user_type

  end
end
