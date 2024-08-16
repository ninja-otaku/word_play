class ChangeGameIdToBigintInGameQuestions < ActiveRecord::Migration[7.1]
  def change
    change_column :game_questions, :game_id, :bigint

  end
end
