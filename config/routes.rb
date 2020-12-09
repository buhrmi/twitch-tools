Rails.application.routes.draw do
  resources :bids
  resources :auctions
  resources :users
  
  get '/auth/:provider/callback', to: 'sessions#create'
  
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get '/(:slug)', to: 'slugs#show'
  end
  
  root to: 'users#new'
end
