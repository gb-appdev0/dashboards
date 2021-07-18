Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", { :controller => "application", :action => "homepage"})

  get("/forex", { :controller => "application", :action => "forex"})

  get("/forex/:foreign", { :controller => "application", :action => "foreign"})

  get("/forex/:foreign/:domestic", { :controller => "application", :action => "domestic"})

end
