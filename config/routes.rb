Rails.application.routes.draw do
  #letter_opener_webのルーティング
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  get 'tentative_users/new'
  post 'tentative_users/create'
  get 'tentative_users/after_new'
  get 'users/new'
  get 'users/new/:token', to: 'users#new'
  post 'users/create', to: 'users#create'
  get '/', to: 'top#index'
  post 'google_users/registration'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
