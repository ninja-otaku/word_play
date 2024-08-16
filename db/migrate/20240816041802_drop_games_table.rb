class DropGamesTable < ActiveRecord::Migration[7.1]

    def up
      drop_table :games
    end
  
    def down
      create_table :games do |t|
        t.integer :user_id
        t.integer :final_score
        t.bigint :game_id
        t.timestamps
      end
    end
  end
  