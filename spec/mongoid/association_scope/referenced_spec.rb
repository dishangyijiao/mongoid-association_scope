# frozen_string_literal: true

RSpec.describe Mongoid::AssociationScope::Referenced do
  describe ".criteria" do
    it "apply :scope option" do
      u = User.create(name: "u1")
      3.times { |i| Post.create(author: u, title: "post #{i}") }
      2.times { |i| Post.create(author: u, title: "published post #{i}", published_at: Time.now).tap { |post| Like.create!(user: u, likeable: post) } }

      expect(u.posts.size).to eq 5
      expect(u.published_posts.size).to eq 2
      expect(u.published_posts.criteria.selector).to eq({ "published_at" => { "$ne" => nil }, "author_id" => u.id })
      expect(u.published_posts.map(&:title)).to include("published post 0", "published post 1")
      expect(u.published_posts.map { |post| post.likes.count }).to eq [1, 1]
    end
  end
end
