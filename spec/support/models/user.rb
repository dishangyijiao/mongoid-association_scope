class User
  include Mongoid::Document

  field :name, type: String

  if mongoid7?
    has_many :published_posts,
             -> { published },
             class_name: "Post",
             inverse_of: nil,
             primary_key: :id,
             foreign_key: :author_id
  else
    has_many :published_posts,
             -> { published },
             class_name: "Post",
             inverse_of: nil,
             foreign_key: :author_id
  end

  has_many :likes
  has_many :posts, inverse_of: :author
end
