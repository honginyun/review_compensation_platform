Rails.application.routes.draw do
  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Tips review resource:

  # CREATE
  get("/tips_reviews/new", { :controller => "tips_reviews", :action => "new_form" })
  post("/create_tips_review", { :controller => "tips_reviews", :action => "create_row" })

  # READ
  get("/tips_reviews", { :controller => "tips_reviews", :action => "index" })
  get("/tips_reviews/:id_to_display", { :controller => "tips_reviews", :action => "show" })

  # UPDATE
  get("/tips_reviews/:prefill_with_id/edit", { :controller => "tips_reviews", :action => "edit_form" })
  post("/update_tips_review/:id_to_modify", { :controller => "tips_reviews", :action => "update_row" })

  # DELETE
  get("/delete_tips_review/:id_to_remove", { :controller => "tips_reviews", :action => "destroy_row" })

  #------------------------------

  # Routes for the Compensations by platform resource:

  # CREATE
  get("/compensations_by_platforms/new", { :controller => "compensations_by_platforms", :action => "new_form" })
  post("/create_compensations_by_platform", { :controller => "compensations_by_platforms", :action => "create_row" })

  # READ
  get("/compensations_by_platforms", { :controller => "compensations_by_platforms", :action => "index" })
  get("/compensations_by_platforms/:id_to_display", { :controller => "compensations_by_platforms", :action => "show" })

  # UPDATE
  get("/compensations_by_platforms/:prefill_with_id/edit", { :controller => "compensations_by_platforms", :action => "edit_form" })
  post("/update_compensations_by_platform/:id_to_modify", { :controller => "compensations_by_platforms", :action => "update_row" })

  # DELETE
  get("/delete_compensations_by_platform/:id_to_remove", { :controller => "compensations_by_platforms", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  get("/reviews/new", { :controller => "reviews", :action => "new_form" })
  post("/create_review", { :controller => "reviews", :action => "create_row" })

  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  get("/reviews/:id_to_display", { :controller => "reviews", :action => "show" })

  # UPDATE
  get("/reviews/:prefill_with_id/edit", { :controller => "reviews", :action => "edit_form" })
  post("/update_review/:id_to_modify", { :controller => "reviews", :action => "update_row" })

  # DELETE
  get("/delete_review/:id_to_remove", { :controller => "reviews", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
