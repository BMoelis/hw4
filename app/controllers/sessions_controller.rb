class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
  
    if @user && BCrypt::Password.new(@user["password"]) == params["password"]
      session["user_id"] = @user["id"]
      flash["notice"] = "You've logged in successfully."
      redirect_to "/places"
    else
      flash["notice"] = "Invalid email or password."
      redirect_to "/login"
    end
  end
  

  def destroy
    session["user_id"] = nil  # Clears session
    flash["notice"] = "You've logged out."
    redirect_to "/login"
  end
end
  