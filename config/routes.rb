require 'sidekiq/web'

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'

  root to: "welcome#index"
  resources :welcome do
    collection do
      post :dispatch_mail
      get :new_handling_error
      post :handling_error_mail
    end
  end

  resources :imports, only: [:index]
end
