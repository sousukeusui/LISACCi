Rails.application.routes.draw do
  get 'tentative_users/new'
  post 'tentative_users/create'
  get 'users/new'
  get '/', to: 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
