class CreateGameQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :game_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :final_score
      t.string :user_response
      t.integer :score
      t.integer :game_id

      t.timestamps
    end
  end
end
