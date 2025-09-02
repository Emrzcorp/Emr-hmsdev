Rails.application.routes.draw do
 
  root "pages#ot"
  get 'pages/home'
  devise_for :users
  get 'home/index'
  get "ot", to: "pages#ot"
  get "appointment", to: "pages#appointment"
  get "Confirmed", to: "pages#Confirmed"
  get "collection", to: "pages#collection" 
  get "requests", to: "pages#requests" 
  get "settings", to: "pages#settings" 
  get "ehrsetting", to: "pages#ehrsetting" 
  get "day", to: "pages#day" 
  get "week", to: "pages#week" 
  get "intake", to: "pages#intake" 
  get "practicefusiondefaultform", to: "pages#practicefusiondefaultform" 
  get "intakenew", to: "pages#intakenew" 
  get "task", to: "pages#task" 
  get "mytask", to: "pages#mytask" 
  get "tool", to: "pages#tool" 
  get "unassignedtask", to: "pages#unassignedtask" 
  get "reviewquestion", to: "pages#reviewquestion" 
  get "rxchange", to: "pages#rxchange" 
  get "labresults", to: "pages#labresults" 
  get "refillrequests", to: "pages#refillrequests"
  get "imagingresults", to: "pages#imagingresults"
  get "chart", to: "pages#chart"
  get "scheduled", to: "pages#scheduled"
  get "recentpatients", to: "pages#recentpatients"
  get "patientrecoad", to: "pages#patientrecoad"
  get "timeline", to: "pages#timeline"
  get "profile", to: "pages#profile"
  get "recoaddate", to: "pages#recoaddate"
  get "displaysetting", to: "pages#displaysetting"
  get "report", to: "pages#report"
  get "patientlistreport", to: "pages#patientlistreport"
  get "savepatient", to: "pages#savepatient"
  get "homepage", to: "pages#homepage"
  get "sendintakeform", to: "pages#sendintakeform"
  get "message", to: "pages#message"
  get "messagesent", to: "pages#messagesent"
  get "messagearchive", to: "pages#messagearchive"
  get 'pages/appointment_modal', to: 'pages#appointment_modal'
   
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :patients do
    resources :appointments, only: [:index, :new, :create] 
    resources :medical_records, only: [:index, :new, :create]
  end

  resources :doctors do
    resources :appointments, only: [:index]               
  end

  resources :appointments do
    collection do
      get :calendar
    end
  end

  resources :medical_records

  get "dashboard", to: "dashboard#show"
end
