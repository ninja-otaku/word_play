# == Schema Information
#
# Table name: question_banks
#
#  id               :bigint           not null, primary key
#  add_word         :string
#  base_word        :string
#  category         :string
#  difficulty_level :string
#  equals_word      :string
#  subtract_word    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class QuestionBank < ApplicationRecord
end
