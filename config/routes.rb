Rails.application.routes.draw do
  post 'person', to: 'person#create'
  get 'person/:id', to: 'person#read'
  put 'person', to: 'person#update'
  delete 'person/:id', to: 'person#delete'

  root 'address_book#index'

  get '/address_book', to: 'address_book#index'
  get '/person/:id/addresses', to: 'person#addresses', as: 'person_addresses'
  post '/person/:id/addresses', to: 'address#create'
  get 'address/:id', to: 'address#read'
  put 'address', to: 'address#update'
  delete 'address/:id', to: 'address#delete'
  
  get '/person/:id/emails', to: 'person#emails', as: 'person_emails'
  post '/person/:id/emails', to: 'email#create'
  get 'email/:id', to: 'email#read'
  put 'email', to: 'email#update'
  delete 'email/:id', to: 'email#delete'

  get '/person/:id/phones', to: 'person#phones', as: 'person_phones'
  post '/person/:id/phones', to: 'phone#create'
  get 'phone/:id', to: 'phone#read'
  put 'phone', to: 'phone#update'
  delete 'phone/:id', to: 'phone#delete'

  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
