class Question
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps
  belongs_to :user
  has_many :answers

  field :title
  field :type
  field :body
  field :tags,     type: Array
  field :choices,  type: Array
  field :location, type: Array
  field :private,  type: Boolean, default: false
  field :likes,    type: Integer, default: 0
  field :likers,   type: Array

  validates_presence_of :title, :type, :private, :likes
  slug :title, :history => true


  private

  def self.sanitize_params(question)
    question[:choices] = question[:choices].values
    question[:tags] = question[:tags].split(",")
    if question[:private] == "0"
      question[:private] = 0
    else
      question[:private] = 1
    end
    return question
  end
end
