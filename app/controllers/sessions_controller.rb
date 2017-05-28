class SessionsController < ApplicationController
  skip_before_action :authenticate
  layout 'login'

  def new
    redirect_to '/' if session[:api_token]
  end

  def create
    token_parameters = { facebook_token: params.require(:facebook_token), device: { type: :admin, identifier: request.remote_ip } }
    token = create_endpoint.post "/v1/token", token_parameters

    if token.status == 200
      session[:api_token] = token.body['token']
      session[:user] = token.body['user']
    end

    render json: { session: true }
  end
end