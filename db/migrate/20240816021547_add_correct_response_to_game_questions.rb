class AddCorrectResponseToGameQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :game_questions, :correct_response, :string
  end
end
