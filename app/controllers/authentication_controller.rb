class AuthenticationController < ApplicationController

  def index
  end

  # route user to correct user contr

  def login
    if @user.exists?
      UserMailer.with(user:@user).deliver_now
    end
  end

  # def wedding_login
  #   redirect_to controller: :wedding,action: :index
  # end

  private

  def set_user
    @user = User.find_by params[:email]
  end
end
