Rails.application.routes.draw do
  root 'tops#index'
  get 'privacy_policy', to: 'tops#privacy_policy'
  get 'terms_of_service', to: 'tops#terms_of_service'
  resources :devil_fruits, only: %i[index] do
    collection do
      get 'crush'
      get 'result'
    end
  end
end
