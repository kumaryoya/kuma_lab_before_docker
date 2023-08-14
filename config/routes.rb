Rails.application.routes.draw do
  root 'tops#index'
  resources :devil_fruits, only: %i[index] do
    collection do
      get 'crush'
      get 'result'
    end
  end
end
