Rails.application.routes.draw do
  resources :projects do
    resources :milestones, shalow: true, except: [:index, :show]
    resources :invoices, shalow: true, except: [:index, :show]
  end
  get 'outlook', to: 'outlook#index'

  root 'projects#index'
end
