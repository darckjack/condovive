Rails.application.routes.draw do
  get '/condos/:id/apartments', to: 'apartments#index'
  get '/condos/:condo_id/apartments/:apartment_id', to: 'apartment#show'
  post '/condos/:id/apartments', to: 'apartments#create'
  put '/condos/:condo_id/apartments/:apartment_id', to: 'apartment#update'
  delete '/condos/:condo_id/apartments/:apartment_id', to: 'apartment#delete'
  get '/condos', to: 'condos#index'
  get '/condos/:id', to: 'condos#show', as: 'condo'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
