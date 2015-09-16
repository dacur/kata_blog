require 'spec_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:body) }

  describe "valid post" do
    subject(:post) { build(:post) }
    it "has a title and a body" do
      expect(post).to be_valid
      expect(post.title).to be_a(String)
      expect(post.body).to be_a(String)
    end
  end
end
