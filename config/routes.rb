Rails.application.routes.draw do
  post 'auth/register', to: 'users#register'
  post 'auth/login', to: 'users#login'
  get '/users', to: 'users#index'

  post '/condos/:condo_id/apartments/:apartment_id/fees', to: 'fees#create'
  put '/condos/:condo_id/apartments/:apartment_id/fees/:fee_id', to: 'fees#pay'
  get '/condos/:condo_id/apartments/:apartment_id/fees/:fee_id', to: 'fees#show'
  get '/condos/:condo_id/apartments/:apartment_id/fees', to: 'fees#unpaid'
  get '/condos/:condo_id/apartments/:apartment_id/payments', to: 'fees#paid'

  get '/condos/:condo_id/apartments/:apartment_id/residents', to: 'residents#index'
  get '/condos/:condo_id/apartments/:apartment_id/residents/:resident_id', to: 'residents#show'
  post '/condos/:id/apartments/:apartment_id/residents', to: 'residents#create'
  put '/condos/:condo_id/apartments/:apartment_id/residents/:resident_id', to: 'residents#update'
  delete '/condos/:condo_id/apartments/:apartment_id/residents/:resident_id', to: 'residents#delete'

  get '/condos/:id/apartments', to: 'apartments#index'
  get '/condos/:condo_id/apartments/:apartment_id', to: 'apartments#show'
  post '/condos/:id/apartments', to: 'apartments#create'
  put '/condos/:condo_id/apartments/:apartment_id', to: 'apartments#update'
  delete '/condos/:condo_id/apartments/:apartment_id', to: 'apartments#delete'

  post '/condos', to: 'condos#create'
  get '/condos', to: 'condos#index'
  get '/condos/:id', to: 'condos#show', as: 'condo'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
