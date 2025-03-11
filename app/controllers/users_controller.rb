class UsersController < ApplicationController
  def new
  end

  require 'bcrypt'

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])

    if @user["username"].blank?
      flash["notice"] = "Username is required."
      redirect_to "/users/new" and return
    end

    if @user.save
      session["user_id"] = @user.id
      redirect_to "/"
    else
      flash["notice"] = "Signup failed."
      redirect_to "/users/new"
    end
  end
end
