require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "comments#create action" do
=begin
    it "should return http status code of not found if the user isn't found" do
      user = FactoryGirl.create(:user)
      sign_in user

      gram = FactoryGirl.create(:gram)

      post :create, gram_id: gram.id, user_id: "BLABLA",  comment: {message: "boom"}
      expect(response).to have_http_status(:unprocessable_entity)
    end
=end

    it "should allow users to create comments on grams" do
      user = FactoryGirl.create(:user)
      sign_in user

      gram = FactoryGirl.create(:gram)

      post :create, gram_id: gram.id, comment: {message: "boom"}
      expect(response).to redirect_to root_path

      expect(gram.comments.length).to eq 1
      expect(gram.comments.first.message).to eq("boom")
    end

    it "should require a user to be logged in to comment on gram" do
      gram = FactoryGirl.create(:gram)
      post :create, gram_id: gram.id, comment: {message: "boom"}
      expect(response).to redirect_to new_user_session_path
    end

    it "should return http status code of not found if the gram isn't found" do
      user = FactoryGirl.create(:user)
      sign_in user
      
      post :create, gram_id: "BLABLA", comment: {message: "boom"}
      expect(response).to have_http_status(:not_found)
    end

  end

end
