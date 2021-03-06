Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "reviews#index"
  
  # Routes for the Vote comment resource:

  # CREATE
  get("/vote_comments/new", { :controller => "vote_comments", :action => "new_form" })
  post("/create_vote_comment", { :controller => "vote_comments", :action => "create_row" })
  post("/create_vote_comment_from_comment", { :controller => "vote_comments", :action => "create_row_from_comment" })

  # READ
  get("/vote_comments", { :controller => "vote_comments", :action => "index" })
  get("/vote_comments/:id_to_display", { :controller => "vote_comments", :action => "show" })

  # UPDATE
  get("/vote_comments/:prefill_with_id/edit", { :controller => "vote_comments", :action => "edit_form" })
  post("/update_vote_comment/:id_to_modify", { :controller => "vote_comments", :action => "update_row" })

  # DELETE
  get("/delete_vote_comment/:id_to_remove", { :controller => "vote_comments", :action => "destroy_row" })
  get("/delete_vote_comment_from_comment/:id_to_remove", { :controller => "vote_comments", :action => "destroy_row_from_comment" })
  get("/delete_vote_comment_from_voter/:id_to_remove", { :controller => "vote_comments", :action => "destroy_row_from_voter" })

  #------------------------------

  # Routes for the Product resource:

  # CREATE
  get("/products/new", { :controller => "products", :action => "new_form" })
  post("/create_product", { :controller => "products", :action => "create_row" })

  # READ
  get("/products", { :controller => "products", :action => "index" })
  get("/products/:id_to_display", { :controller => "products", :action => "show" })

  # UPDATE
  get("/products/:prefill_with_id/edit", { :controller => "products", :action => "edit_form" })
  post("/update_product/:id_to_modify", { :controller => "products", :action => "update_row" })

  # DELETE
  get("/delete_product/:id_to_remove", { :controller => "products", :action => "destroy_row" })

  #------------------------------

  # Routes for the Vote resource:

  # CREATE
  get("/votes/new", { :controller => "votes", :action => "new_form" })
  post("/create_vote", { :controller => "votes", :action => "create_row" })
  post("/create_vote_from_review", { :controller => "votes", :action => "create_row_from_review" })

  # READ
  get("/votes", { :controller => "votes", :action => "index" })
  get("/votes/:id_to_display", { :controller => "votes", :action => "show" })

  # UPDATE
  get("/votes/:prefill_with_id/edit", { :controller => "votes", :action => "edit_form" })
  post("/update_vote/:id_to_modify", { :controller => "votes", :action => "update_row" })

  # DELETE
  get("/delete_vote/:id_to_remove", { :controller => "votes", :action => "destroy_row" })
  get("/delete_vote_from_user/:id_to_remove", { :controller => "votes", :action => "destroy_row_from_user" })
  get("/delete_vote_from_review/:id_to_remove", { :controller => "votes", :action => "destroy_row_from_review" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })
  post("/create_comment_from_review", { :controller => "comments", :action => "create_row_from_review" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })
  get("/delete_comment_from_commenter/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_commenter" })
  get("/delete_comment_from_review/:id_to_remove", { :controller => "comments", :action => "destroy_row_from_review" })

  #------------------------------

  # Routes for the Tips review resource:

  # CREATE
  get("/tips_reviews/new", { :controller => "tips_reviews", :action => "new_form" })
  post("/create_tips_review", { :controller => "tips_reviews", :action => "create_row" })
  post("/create_tips_review_from_review", { :controller => "tips_reviews", :action => "create_row_from_review" })

  # READ
  get("/tips_reviews", { :controller => "tips_reviews", :action => "index" })
  get("/tips_reviews/:id_to_display", { :controller => "tips_reviews", :action => "show" })

  # UPDATE
  get("/tips_reviews/:prefill_with_id/edit", { :controller => "tips_reviews", :action => "edit_form" })
  post("/update_tips_review/:id_to_modify", { :controller => "tips_reviews", :action => "update_row" })

  # DELETE
  get("/delete_tips_review/:id_to_remove", { :controller => "tips_reviews", :action => "destroy_row" })
  get("/delete_tips_review_from_user/:id_to_remove", { :controller => "tips_reviews", :action => "destroy_row_from_user" })
  get("/delete_tips_review_from_review/:id_to_remove", { :controller => "tips_reviews", :action => "destroy_row_from_review" })

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
  post("/create_review_from_product", { :controller => "reviews", :action => "create_row_from_product" })

  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  get("/reviews/:id_to_display", { :controller => "reviews", :action => "show" })

  # UPDATE
  get("/reviews/:prefill_with_id/edit", { :controller => "reviews", :action => "edit_form" })
  post("/update_review/:id_to_modify", { :controller => "reviews", :action => "update_row" })

  # DELETE
  get("/delete_review/:id_to_remove", { :controller => "reviews", :action => "destroy_row" })
  get("/delete_review_from_product/:id_to_remove", { :controller => "reviews", :action => "destroy_row_from_product" })
  get("/delete_review_from_reviewer/:id_to_remove", { :controller => "reviews", :action => "destroy_row_from_reviewer" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
