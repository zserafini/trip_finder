Rails.application.routes.draw do

  resources :cities, only: [] do
    collection do
      get 'search'
    end
  end

end
