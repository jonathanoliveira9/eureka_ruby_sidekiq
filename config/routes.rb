Rails.application.routes.draw do
  root to: "welcome#index"
  resources :welcome do
    collection do
      post :dispatch_mail
    end
  end
end
