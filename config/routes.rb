require 'sidekiq/web'

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'

  root to: "welcome#index"
  resources :welcome do
    collection do
      post :dispatch_mail
    end
  end
end
