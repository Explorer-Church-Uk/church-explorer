class ApplicationController < ActionController::Base
  after_action :skip_session
end
