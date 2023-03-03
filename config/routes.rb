Rails.application.routes.draw do
  post 'person', to: 'person#create'
  get 'person/read'
  get 'person/update'
  delete 'person', to: 'person#delete'
  get '/address_book', to: 'address_book#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
