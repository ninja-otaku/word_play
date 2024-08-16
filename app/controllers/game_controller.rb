class GameController < ApplicationController
  def index
    render({ :template => "games/index" })
  end
  def game_page
    render({:template=>"games/show"})
  end
end
