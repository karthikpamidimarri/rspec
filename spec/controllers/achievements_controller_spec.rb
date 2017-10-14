require 'rails_helper'

describe AchievementsController do
  #GET request a verb and second word is the name of the action
  describe "GET new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new Achivement to @achievement"

  end
end