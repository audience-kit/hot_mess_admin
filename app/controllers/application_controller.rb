class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  def authenticate
    puts "Session => #{session.inspect}"

    redirect_to controller: :sessions, action: :new unless session[:api_token]
  end
end
