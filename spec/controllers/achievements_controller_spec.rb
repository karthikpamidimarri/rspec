require 'rails_helper'

describe AchievementsController do
  #GET request a verb and second word is the name of the action
  describe "GET new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new Achivement to @achievement" do
      get :new
      expect(assigns(:achievement)).to be_a_new(Achievement)
    end
  end

  describe "GET show" do
  let(:achievement) { FactoryGirl.create(:public_achievement)}
    it "renders :show template" do
      get :show, params: { id: achievement}
      expect(response).to render_template(:show)
    end

    it "assigns requested achievement to @achievement" do
      get :show, params: { id: achievement}
      expect(assigns(:achievement)).to eq(achievement)
    end
  end


  describe "POST create" do
    it "redirects to achievement#show" do
      post :create, params: {achievement: FactoryGirl.attributes_for(:public_achievement) }
      expect(response).to redirect_to(achievement_path(assigns[:achievement]))
    end

    it "creates new achievement in database" do
      expect {
        post :create, params: {achievement: FactoryGirl.attributes_for(:public_achievement) }
      }.to change(Achievement,:count).by(1)
    end
  end
end