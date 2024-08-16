# == Schema Information
#
# Table name: games
#
#  id          :bigint           not null, primary key
#  final_score :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  game_id     :bigint
#  user_id     :integer
#
class Game < ApplicationRecord
end
