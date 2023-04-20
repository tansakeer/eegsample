Rails.application.routes.draw do



  # Routes for the Epilepsy type resource:
  # HOMEPAGE

  get("/", { :controller => "questions", :action => "index" })


  # CREATE
  post("/insert_epilepsy_type", { :controller => "epilepsy_types", :action => "create" })
          
  # READ
  get("/epilepsy_types", { :controller => "epilepsy_types", :action => "index" })
  
  get("/epilepsy_types/:path_id", { :controller => "epilepsy_types", :action => "show" })
  
  # UPDATE
  
  post("/modify_epilepsy_type/:path_id", { :controller => "epilepsy_types", :action => "update" })
  
  # DELETE
  get("/delete_epilepsy_type/:path_id", { :controller => "epilepsy_types", :action => "destroy" })

  #------------------------------

  # Routes for the Comment eeg type resource:

  # CREATE
  post("/insert_comment_eeg_type", { :controller => "comment_eeg_types", :action => "create" })
          
  # READ
  get("/comment_eeg_types", { :controller => "comment_eeg_types", :action => "index" })
  
  get("/comment_eeg_types/:path_id", { :controller => "comment_eeg_types", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment_eeg_type/:path_id", { :controller => "comment_eeg_types", :action => "update" })
  
  # DELETE
  get("/delete_comment_eeg_type/:path_id", { :controller => "comment_eeg_types", :action => "destroy" })

  #------------------------------

  # Routes for the Eeg type resource:

  # CREATE
  post("/insert_eeg_type", { :controller => "eeg_types", :action => "create" })
          
  # READ
  get("/eeg_types", { :controller => "eeg_types", :action => "index" })
  
  get("/eeg_types/:path_id", { :controller => "eeg_types", :action => "show" })
  
  # UPDATE
  
  post("/modify_eeg_type/:path_id", { :controller => "eeg_types", :action => "update" })
  
  # DELETE
  get("/delete_eeg_type/:path_id", { :controller => "eeg_types", :action => "destroy" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Question resource:

  # CREATE
  post("/insert_question", { :controller => "questions", :action => "create" })
          
  # READ
  post("/zebra", { :controller => "questions", :action => "zebra_create" })
  
  get("/questions/:path_id", { :controller => "questions", :action => "show" })
  
  # UPDATE
  
  post("/modify_question/:path_id", { :controller => "questions", :action => "update" })
  
  # DELETE
  get("/delete_question/:path_id", { :controller => "questions", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })

  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
