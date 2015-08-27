Spree::Core::Engine.add_routes do
  namespace :admin do
  	get :traffic, to: "traffic#index", as: "traffic"
  	get "traffic/trend", to: "traffic#trend"
  end
end