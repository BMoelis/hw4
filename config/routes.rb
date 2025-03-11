Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })
  delete "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end
