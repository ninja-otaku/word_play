class RenameGameQuestionsCountToGameId < ActiveRecord::Migration[7.1]
  def change 
    # Rename the column
    rename_column :games, :game_questions_count, :game_id

    # Change the column type to bigint
    change_column :games, :game_id, :bigint
  end
end
