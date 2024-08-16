# == Schema Information
#
# Table name: game_questions
#
#  id               :bigint           not null, primary key
#  correct_response :string
#  final_score      :integer
#  score            :integer
#  user_response    :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  game_id          :integer
#  question_id      :integer
#  user_id          :integer
#
class GameQuestion < ApplicationRecord
end
