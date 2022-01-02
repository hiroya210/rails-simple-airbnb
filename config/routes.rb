Rails.application.routes.draw do

  root to: "flats#home"
  resources :flats

end
