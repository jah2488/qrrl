class Badge
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps
  belongs_to :user
end
