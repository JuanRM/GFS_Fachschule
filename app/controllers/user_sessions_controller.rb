class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end


  def create
    if @user = login(params[:email].downcase, params[:password])
      redirect_back_or_to("/index.html")

    else
      flash[:error] = 'Login failed'
      redirect_to("/login")
    end
  end


  def destroy
    logout
      redirect_back_or_to("/index.html")
  end

end
