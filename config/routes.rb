Spree::Core::Engine.add_routes do
  namespace :admin do
  	get :traffic, to: "traffic#index", as: "traffic"
  	get "traffic/trend", to: "traffic#trend"
  	
  	get "/dashboard/data_dashboard", to: "dashboard#data_dashboard"
  	get "/dashboard/data_dashboard_pie", to: "dashboard#data_dashboard_pie"
  	get '/dashboard', to: "dashboard#index"
  end
end