require 'securerandom'
class ApplicationController < ActionController::Base
  # needed for submitting forms without cookies
  skip_before_action :verify_authenticity_token
  # after_action :skip_sessions
  after_action :rotate_login_token

  def rotate_login_token
    user = User.find_by({token:params[:token]})
    new_token = SecureRandom.urlsafe_base64
    user.update({token:new_token})
    user.save
    params[:token] = new_token
  end
  def logged_in?(user)
    user.token == params[:token] || false
  end
end
