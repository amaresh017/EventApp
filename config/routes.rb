Rails.application.routes.draw do


  devise_for :users , controllers: { sessions: 'users/sessions', registrations: 'users/registrations' } do 
    '/users/sign_out' => 'devise/sessions#destroy'
  end


  resources :users, only: [:show, :edit, :update] do
    #get :me, on: :member
  end

  resources :events, only: [:create]

  root to: "home#index"
end
