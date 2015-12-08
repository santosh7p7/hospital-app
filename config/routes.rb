Webapp::Application.routes.draw do
  namespace :api, format: :json do
    resources :departments do
      resources :users do
        resources :chats
      end
    end
  end
end
