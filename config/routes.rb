Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :customers, only: [:index]
  resources :movies, only: [:index, :show, :create]

  post "rentals/check_out", to: "rentals#check_out", as: "check_out"
  post "rentals/:id/check_in", to: "rentals#check_in", as: "check_in"

  get "/zomg", to: "movies#zomg", as: "zomg"
end
