Rails.application.routes.draw do

  # API routes
  namespace :api do
    resources :group_events, :only => [:index,:show,:create,:update,:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
