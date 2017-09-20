class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      #sign user in, proceed normally
      session[:user_id] = user.id
      flash[:success] = "Successfully created account!"
      redirect_to "/products"
    else
      #flash a warning and redirect to signup page
      flash[:warning] = "Invalid email or password"
      redirect_to "/signup"
    end
  end

end
