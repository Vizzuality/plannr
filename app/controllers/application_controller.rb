class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :basic_http_authentication

  def basic_http_authentication
    return unless ["production", "staging"].include?(Rails.env)
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == ENV["BASIC_AUTH_PASS"]
    end
  end
end
