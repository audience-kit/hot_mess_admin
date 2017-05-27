API_ENDPOINT, FACEBOOK_APP_ID = case Rails.env
  when 'development'
    ['http://local.hotmess.social:3000',842337999153841]
  when 'staging'
    ['https://next-api.hotmess.social', 915436455177328]
  else
    ['https://api.hotmess.social', 713525445368431]
               end

API_CONNECTION = Faraday.new(:url => API_ENDPOINT) do |faraday|
  faraday.request  :json             # form-encode POST params
  faraday.response :json, :content_type => /\bjson$/
  faraday.response :logger
  faraday.use :instrumentation
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end