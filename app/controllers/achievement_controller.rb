class AchievementController < ApplicationController
  def new
    @achievement = Achievement.new
  end
end