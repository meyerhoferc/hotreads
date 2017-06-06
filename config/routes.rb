Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'links#index'

  namespace :api do
    namespace :v1 do
      get 'links', to: 'links#index'
      get 'top-link', to: 'links#show'
      post 'links', to: 'links#create'
    end
  end
end
