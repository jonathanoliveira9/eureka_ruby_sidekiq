Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: "welcome#index"
  resources :welcome do
    collection do
      post :dispatch_mail
    end
  end
end
