class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  after_action :skip_session
end
