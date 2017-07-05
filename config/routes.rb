Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do 
  	resources :department
  	resources :employee
  end
  

  get '/api' => redirect('/swagger/dist/index.html?url=/api-docs.json')
end
