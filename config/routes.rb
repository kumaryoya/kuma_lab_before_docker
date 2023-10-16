# frozen_string_literal: true

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
  resources :zoos, only: %i[index show]
  resources :dogs, only: %i[index]
  resources :cats, only: %i[index]
  resources :qiitas, only: %i[index]
  resources :mangas, only: %i[index] do
    collection do
      get 'genre'
    end
  end
  resources :shoguns, only: %i[show new] do
    collection do
      post 'scoring'
    end
  end
  resources :movies, only: %i[index new create]
end
