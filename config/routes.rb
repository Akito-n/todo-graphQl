# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks do
    collection do
      get :graph, to: 'tasks#graph_index'
    end
  end
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
