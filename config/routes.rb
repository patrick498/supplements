Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: proc { [200, {}, ['{"status":"API running"}']] }
      devise_for :users,
        path: '',
        path_names: {
          sign_in: 'login',
          sign_out: 'logout'
        },
        controllers: {
          sessions: 'api/v1/sessions'
        }
      resources :intakes, only: [:index, :create, :destroy, :update, :show]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
