Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  post '/', to: 'home#create'

  resources :power_station, only: [:show, :create], path: 'power-station' do
    resource :importers, only: [:new, :create]
    resource :daily_records, only: [:show], path: 'daily-records'
  end

end
