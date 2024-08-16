Rails.application.routes.draw do
  # Routes for the Game resource:

  # CREATE
  post("/insert_game", { :controller => "games", :action => "create" })
          
  # READ
  get("/games", { :controller => "games", :action => "index" })
  
  get("/games/:path_id", { :controller => "games", :action => "show" })
  
  # UPDATE
  
  post("/modify_game/:path_id", { :controller => "games", :action => "update" })
  
  # DELETE
  get("/delete_game/:path_id", { :controller => "games", :action => "destroy" })

  #------------------------------

  # Routes for the Game question resource:

  # CREATE
  post("/insert_game_question", { :controller => "game_questions", :action => "create" })
          
  # READ
  get("/game_questions", { :controller => "game_questions", :action => "index" })
  
  get("/game_questions/:path_id", { :controller => "game_questions", :action => "show" })
  
  post("/results_form",{:controller=>"game_questions",:action=>"results"})
  get("/results",{:controller=>"game_questions",:action=>"results_display"})
  get("/results/:path_id",{:controller=>"game_questions",:action=>"results_display"})
  
  # UPDATE
  
  post("/modify_game_question/:path_id", { :controller => "game_questions", :action => "update" })
  
  # DELETE
  get("/delete_game_question/:path_id", { :controller => "game_questions", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  get("/",{:controller=>"game",:action=>"index"})
  get("/game/:game_id",{:controller=>"game",:action=>"game_page"})
  
end
