API_ENDPOINT, FACEBOOK_APP_ID = case Rails.env
  when 'development'
    ['http://local.hotmess.social:3000',842337999153841]
  when 'staging'
    ['https://next-api.hotmess.social', 915436455177328]
  else
    ['https://api.hotmess.social', 713525445368431]
               end

