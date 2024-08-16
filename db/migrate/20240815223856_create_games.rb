class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :final_score
      t.integer :game_questions_count

      t.timestamps
    end
  end
end
