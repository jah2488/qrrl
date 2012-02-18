class Question
  include Mongoid::Document
  # include Mongoid::Slug
  include Mongoid::Timestamps
  belongs_to :user
  has_many :answers
end
