Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api', path: '/', as: :api do
    namespace :v1 do
      resources :apidocs, only: :index
      resources :users, only: :show do
        resources :accounts, only: :index
      end
      resources :accounts, only: :show
    end
  end
end
