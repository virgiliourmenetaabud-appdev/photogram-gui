Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:user_page", { :controller => "users", :action => "show"})
  get("/insert_user", { :controller => "users", :action => "new_user"})
  get("/edit_user/:edited_user", { :controller => "users", :action => "edit_user"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:photo_page", { :controller => "photos", :action => "show_photo"})

  get("/delete_photo/:deleted", { :controller => "photos", :action => "delete_photo"})
  get("/insert_photo", { :controller => "photos", :action => "create"})
  get("/update_photo/:updated", { :controller => "photos", :action => "update"})
  get("/new_comment/:photo", { :controller => "photos", :action => "new_comment"})

end
