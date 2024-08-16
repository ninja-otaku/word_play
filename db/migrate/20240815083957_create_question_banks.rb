class CreateQuestionBanks < ActiveRecord::Migration[7.1]
  def change
    drop_table :question_banks if table_exists?(:question_banks)

    create_table :question_banks do |t|
      t.string :difficulty_level
      t.string :category
      t.string :base_word
      t.string :add_word
      t.string :subtract_word
      t.string :equals_word

      t.timestamps
    end
  end
end



