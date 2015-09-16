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

  describe "POST /create" do
    context "with valid params" do
      let(:valid_params) { attributes_for(:post, title: "Hello World", body: "This is my first post!") }
      it "creates a blog post" do
        post :create, post: valid_params, format: :json
        expect(response).to have_http_status(:created)
        post_json = JSON.parse(response.body)
        expect(post_json["title"]).to eq("Hello World")
        expect(post_json["body"]).to eq("This is my first post!")
        expect { post :create, post: valid_params, format: :json}.to change{ Post.count }.by(1)
      end
    end
    context "with invalid params" do
      let(:invalid_params) { attributes_for(:post, title: nil) }
      it "does not create a blog post" do
        post :create, post: invalid_params, format: :json
        expect(response).to have_http_status(422)
        errors_json = JSON.parse(response.body)
        expect(errors_json["title"]).to include("can't be blank")
        expect { post :create, post: invalid_params, format: :json}.to_not change{ Post.count }
      end
    end
  end

  describe "PUT /update" do
    let(:post) { create(:post) }
    let(:new_params) { attributes_for(:post, title: "Hello New World", body: "Blah blah blah.") }
    it "allows you to edit a blog post" do
      post
      put :update, id: post.id, post: new_params, format: :json
      expect(response).to have_http_status(:ok)
      post_json = JSON.parse(response.body)
      expect(post_json["title"]).to eq("Hello New World")
      expect(post_json["body"]).to eq("Blah blah blah.")
      expect { put :update, id: post.id, post: new_params, format: :json}.to_not change{ Post.count }
    end
  end

end
