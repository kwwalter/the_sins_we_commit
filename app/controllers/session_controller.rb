class SessionController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email])

    # this handles both wrong email and wrong password
    if user && user.authenticate(user_params[:password])
      session[:current_user_id] = user.id
      flash[:message] = "Thanks for logging in, sinner."
    else
      flash[:message] = "Email / Password combo does not exist"
    end

    redirect_to root_path
  end

  def destroy
    session[:current_user_id] = nil

    flash[:message] = "You have successfully logged out"
    redirect_to root_path
  end


  private

  def user_params
    return params.require(:user).permit(:email, :password)
  end

end
