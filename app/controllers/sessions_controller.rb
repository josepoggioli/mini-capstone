class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully Logged in!"
      redirect_to "/products"
    else
      flash[:warning] = "Invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil 
    flash[:warning] = "Successfully logged out."
    redirect_to "/products"
  end

end
