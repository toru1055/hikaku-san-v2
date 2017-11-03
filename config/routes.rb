Rails.application.routes.draw do
  resources :columns
  resources :elements
  resources :types
  resources :items

  resources :tables do
    member do
      get 'add_column'
      get 'add_item'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
