Rails.application.routes.draw do
  
  resources :event_patients do
    get :change_status, :on => :member    
  end
  resources :events do
    get :print, :on => :member
  end
  resources :studies
  resources :scheduling
  resources :study_pages
  
  resources :document_topic_sub_topics
  resources :documents
  resources :reminders
  resources :scales
  resources :outputs
  resources :inputs do 
    get :print, :on => :member
  end
  resources :products
  
  resources :patients do 
    get :statistics, :on => :collection
  end
  
  resources :members do 
    get :print, :on => :member
  end
  
  resources :stocks do 
    get :shopping_list, :on => :collection
  end
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
