Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'api/v1' do
    jsonapi_resources :heroes
    jsonapi_resources :abilities
  end
end
