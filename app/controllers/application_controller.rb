class ApplicationController < ActionController::Base
  # needed for submitting forms without cookies
  skip_before_action :verify_authenticity_token
  # after_action :skip_sessions
end
