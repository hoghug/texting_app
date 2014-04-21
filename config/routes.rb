Reelio::Application.routes.draw do
  devise_for :users

  resources :users do
    resources :contacts
    resources :messages
  end
  resources :shares

  root "users#show"
end
