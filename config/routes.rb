Reelio::Application.routes.draw do
  devise_for :users

  resources :users do
    resources :contacts
  end


  root "users#show"
end
