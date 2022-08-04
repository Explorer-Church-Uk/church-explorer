require 'securerandom'
class ApplicationController < ActionController::Base
  # needed for submitting forms without cookies
  skip_before_action :verify_authenticity_token
  # after_action :skip_sessions
  after_action :rotate_login_token

  def find_user_from_token
    User.find_by({token:params[:token]})
    end
  def get_user_id_from_token
    User.find_by({token:params[:token]}).id
  end

  def rotate_login_token
    if params[:token]
      user = find_user_from_token
      new_token = SecureRandom.urlsafe_base64
      user.update({token:new_token})
      user.save
      params[:token] = new_token
    end
  end
  def logged_in?(user)
    user.token == params[:token]
  end
  def is_overseer?
    Overseer.find_by({user: get_user_id_from_token()}).exists?
  end
  def is_member?
    Member.find_by({user: get_user_id_from_token}).exists?
    end
  def is_deacon?
    Deacon.find_by({user: get_user_id_from_token}).exists?
  end
  def is_admin?
    Admin.find_by({user: get_user_id_from_token}).exists?
  end

  def user_has_wedding?
    Wedding.find_by(user:get_user_id_from_token).exists?
  end
  def has_wedding_date?
    Wedding.find_by(user:get_user_id_from_token).actual_wedding_date.nil? != true
  end
  def redirect_to_login
    redirect_to controller: :authentication, action: :login
  end
  def ensure_logged_in
    logged_in? ? true : (redirect_to_login())
  end

  def ensure_is_overseer
    if is_overseer?
      ensure_logged_in
    else
      redirect_to_login
    end
  end
end
