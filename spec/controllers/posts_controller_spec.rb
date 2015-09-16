require 'spec_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /index" do
    let(:post) { create(:post) }
    it "returns all blog posts" do
      post
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      post_json = JSON.parse(response.body)
      expect(post_json.first["title"]).to eq("MyString")
    end
  end
end
