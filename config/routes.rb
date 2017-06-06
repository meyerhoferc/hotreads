Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'links#index'

  namespace :api do
    namespace :v1 do
      post 'links', to: 'links#create'
    end
  end
end
