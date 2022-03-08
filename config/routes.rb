Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "users#toppage"
  resources :users, only: [:show, :edit]do
    member do
      patch 'toppage'
    end
  end
end
