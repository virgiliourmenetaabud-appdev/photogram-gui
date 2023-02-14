Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:user_page", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:photo_page", { :controller => "photos", :action => "show_photo"})

end
