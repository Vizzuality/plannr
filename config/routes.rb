Rails.application.routes.draw do
  resources :projects
  get 'outlook', to: 'outlook#index'

  root 'projects#index'
end
