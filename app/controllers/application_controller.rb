class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  def authenticate
    puts "Session => #{session.inspect}"

    redirect_to controller: :sessions, action: :new unless session[:api_token]
  end

  private
  def create_endpoint
     Faraday.new(:url => API_ENDPOINT) do |faraday|
      faraday.request  :json             # form-encode POST params
      faraday.response :json, :content_type => /\bjson$/
      faraday.response :logger
      faraday.use :instrumentation
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP

       if session[:api_token]
         faraday.authorization :JWT, session[:api_token]
       end
    end
  end
end
