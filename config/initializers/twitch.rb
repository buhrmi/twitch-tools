oauth_client = OAuth2::Client.new(
  ENV['TWITCH_CLIENT_ID'],
  ENV['TWITCH_CLIENT_SECRET'],
  site: 'https://id.twitch.tv/',
  token_url: '/oauth2/token')
token = oauth_client.client_credentials.get_token.token
TWITCH_CLIENT = Twitch::Client.new(client_id: ENV['TWITCH_CLIENT_ID'], access_token: token)
