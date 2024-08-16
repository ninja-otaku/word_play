class GameQuestionsController < ApplicationController
  def index
    matching_game_questions = GameQuestion.all

    @list_of_game_questions = matching_game_questions.order({ :created_at => :desc })

    render({ :template => "game_questions/index" })
  end

  def show
    the_id = params.fetch("path_id")

    @game_id = the_id
    
    #matching_game_questions = GameQuestion.where({ :id => the_id })
    matching_records= QuestionBank.all.sample(10)
    (1..10).each do |i|
      instance_variable_set("@the_game_question#{i}", matching_records.at(i - 1))
    end
    render({ :template => "game_questions/show" })
  end

  def results
    game_id = params.fetch("game_id")
    (1..10).each do |i|
      the_game = GameQuestion.new
      the_game.game_id = params.fetch("game_id")
      the_game.question_id=params.fetch("question#{i}_id")
      the_game.correct_response=params.fetch("question#{i}_correct_answer")
      the_game.user_response=params.fetch("answer#{i}")
      the_game.user_id=current_user.id
      # Normalize the answers
      correct_answer_normalized = the_game.correct_response.to_s.strip.downcase.gsub(/[^a-z0-9]/, '')
      user_response_normalized = the_game.user_response.to_s.strip.downcase.gsub(/[^a-z0-9]/, '')
      #x=params.fetch("game_id")

      # Check for approximate match
      if correct_answer_normalized == user_response_normalized
        the_game.score = 1
      else
        the_game.score = 0
      end
      # Save the instance to the database
      if the_game.save
        # Optionally, handle success
      else
        # Optionally, handle errors
        Rails.logger.error("Failed to save GameQuestion #{i}: #{the_game.errors.full_messages.join(', ')}")
      end
    end
    
    # Optionally, redirect or render a response
    #redirect_to some_path, notice: "Results have been processed."
    #Rails.logger.debug("Game ID: #{params.fetch('game_id')}")
    #xy = params.fetch("game_id")
    redirect_to("/results/#{game_id}", { :notice => "Game finished successfully." })
  end

  def results_display
    #the_game = Game.new
    #the_game.id = params.fetch("path_id")
    #x=the_game.id
    #matching_records= GameQuestion.all.where(:id=>x)
    #@total_score = matching_records.sum(:score)
    #the_game.final_score=@total_score
    #if matching_records.exists?
      # Get the user_id from the first record
    #  the_game.user_id = matching_records.first.user_id
    #else
      # Handle the case where no records are found
    #  the_game.user_id = nil # or some other default value
    #end
    #user=User.where(:id=>matching_records.first.user_id)
    #@user_name=user.player_name
    @the_id=params.fetch("path_id")
    render({ :template => "results/show" })
  end

  def create
    the_game_question = GameQuestion.new
    the_game_question.user_id = params.fetch("query_user_id")
    the_game_question.question_id = params.fetch("query_question_id")
    the_game_question.final_score = params.fetch("query_final_score")
    the_game_question.user_response = params.fetch("query_user_response")
    the_game_question.score = params.fetch("query_score")
    the_game_question.game_id = params.fetch("query_game_id")

    if the_game_question.valid?
      the_game_question.save
      redirect_to("/game_questions", { :notice => "Game question created successfully." })
    else
      redirect_to("/game_questions", { :alert => the_game_question.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_game_question = GameQuestion.where({ :id => the_id }).at(0)

    the_game_question.user_id = params.fetch("query_user_id")
    the_game_question.question_id = params.fetch("query_question_id")
    the_game_question.final_score = params.fetch("query_final_score")
    the_game_question.user_response = params.fetch("query_user_response")
    the_game_question.score = params.fetch("query_score")
    the_game_question.game_id = params.fetch("query_game_id")

    if the_game_question.valid?
      the_game_question.save
      redirect_to("/game_questions/#{the_game_question.id}", { :notice => "Game question updated successfully."} )
    else
      redirect_to("/game_questions/#{the_game_question.id}", { :alert => the_game_question.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_game_question = GameQuestion.where({ :id => the_id }).at(0)

    the_game_question.destroy

    redirect_to("/game_questions", { :notice => "Game question deleted successfully."} )
  end
end
