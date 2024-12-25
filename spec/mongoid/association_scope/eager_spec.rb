# frozen_string_literal: true

RSpec.describe Mongoid::AssociationScope::Eager do
  describe "#each_loaded_document" do
    it "apply :scope option" do
      u = User.create(name: "u1")
      3.times { |i| Post.create(author: u, title: "post #{i}") }
      2.times { |i| Post.create(author: u, title: "published post #{i}", published_at: Time.now) }

      u = User.includes(:published_posts).first

      expect(u.posts.size).to eq 5
      expect(u.published_posts.size).to eq 2
      expect(u.published_posts.criteria.selector).to eq({ "published_at" => { "$ne" => nil }, "author_id" => u.id })
      expect(u.published_posts.map(&:title)).to include("published post 0", "published post 1")
    end
  end
end
