Rails.application.routes.draw do
  root to: "welcome#index"
  resources :welcome do
    collection do
      get  :dispatch_mail
    end
  end
end
