Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"

  resources :categories
  resources :expenses
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :expenses, except: [:edit, :new, :show]
    end
  end

end
