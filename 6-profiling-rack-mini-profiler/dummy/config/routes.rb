Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "application#home"
  resources :authors, only: %i(index) do
    resources :posts, only: %i(index show)
  end
end
