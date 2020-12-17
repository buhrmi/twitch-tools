Rails.application.routes.draw do
  resources :bids
  resources :auctions
  resources :users
  resource :session

  get '/auth/:provider/callback', to: 'sessions#create'
  
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get '/(:slug)', to: 'slugs#show'
  end
  
  get '/:twitch_name', to: 'users#show', as: 'twitch_name'

  root to: 'users#new'
end
