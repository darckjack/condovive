Rails.application.routes.draw do
  get '/condos', to: 'condos#index'
  get '/condos/:id', to: 'condos#show', as: 'condo'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
