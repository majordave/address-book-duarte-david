Rails.application.routes.draw do
  post 'person', to: 'person#create'
  get 'person/:id', to: 'person#read', as: "person_read"
  put 'person', to: 'person#update'
  delete 'person/:id', to: 'person#delete', as: "person_delete"

  root 'address_book#index'

  get '/address_book', to: 'address_book#index'
  get '/person/:id/addresses', to: 'person#addresses', as: 'person_addresses'
  post '/person/:id/addresses', to: 'address#create', as: 'address_create'
  get 'address/:id', to: 'address#read', as: 'address_read'
  put 'address', to: 'address#update'
  delete 'address/:id', to: 'address#delete', as: 'address_delete'
  
  get '/person/:id/emails', to: 'person#emails', as: 'person_emails'
  post '/person/:id/emails', to: 'email#create', as: 'email_create'
  get 'email/:id', to: 'email#read', as: 'email_read'
  put 'email', to: 'email#update'
  delete 'email/:id', to: 'email#delete', as: 'email_delete'

  get '/person/:id/phones', to: 'person#phones', as: 'person_phones'
  post '/person/:id/phones', to: 'phone#create', as: 'phone_create'
  get 'phone/:id', to: 'phone#read', as: 'phone_read'
  put 'phone', to: 'phone#update'
  delete 'phone/:id', to: 'phone#delete', as: 'phone_delete'

  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
