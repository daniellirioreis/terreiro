Rails.application.routes.draw do
  
  resources :outputs
  resources :inputs
  resources :products
  resources :patients
  resources :members
  resources :stocks
  devise_for :users

  # resources :trainings
  # resources :evaluations
  # 
  # resources :evaluators do
  #     get :autocomplete_evaluator_name, :on => :collection   
  #  end
  # 
  # 
  # resources :students do 
  #   get :autocomplete_student_name, :on => :collection
  # end
  
  # resources :exercises
  
  root "dashboard#index"
end
