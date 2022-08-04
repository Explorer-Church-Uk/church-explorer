require 'securerandom'
class ApplicationController < ActionController::Base
  # needed for submitting forms without cookies
  skip_before_action :verify_authenticity_token
  # after_action :skip_sessions
  after_action :rotate_login_token

  def find_user_by_token
    User.find_by({token:params[:token]})
  end
  def rotate_login_token
    user = find_user_by_token()
    new_token = SecureRandom.urlsafe_base64
    user.update({token:new_token})
    user.save
    params[:token] = new_token
  end
  def logged_in?(user)
    user.token == params[:token]
  end
  def is_overseer?
    Overseer.find_by({user: find_user_by_token()}).exists?
  end
  def is_laity?
    Laity.find_by({user: find_user_by_token()}).exists?
  end
  def user_has_wedding?
    Wedding.find_by(user:find_user_by_token).exists?
  end
  def has_wedding_date?
    Wedding.find_by(user:find_user_by_token).actual_wedding_date.nil? != true
  end
  #  TODO - write more functions!
end
