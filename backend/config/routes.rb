Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :questions
    resources :question_types
    resources :surveys
    resources :roles
    resources :options

    root to: "users#index"
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index create]
      resources :surveys, only: %i[show]
      resources :roles, only: %i[index]
    end
  end

  get '/jwt_example', to: 'jwt_example#index'
  get '/', to: 'admin/users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
