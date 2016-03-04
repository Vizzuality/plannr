Rails.application.routes.draw do
  resources :projects do
    resources :milestones, shalow: true, except: [:index, :show]
    resources :invoices, shalow: true, except: [:index, :show]

    member do
      patch :archive
    end
  end

  get 'archived_projects', to: 'archived_projects#index'
  get 'outlook', to: 'outlook#index'

  root 'projects#index'
end
