# == Schema Information
#
# Table name: games
#
#  id                   :bigint           not null, primary key
#  final_score          :integer
#  game_questions_count :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer
#
class Game < ApplicationRecord
end
