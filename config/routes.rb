Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles do
    resources :links
  end

  resources :linked_profiles, only: :index
end
