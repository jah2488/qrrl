class Answer
  include Mongoid::Document
  # include Mongoid::Slug
  include Mongoid::Timestamps
  belongs_to :user
  belongs_to :question
end
