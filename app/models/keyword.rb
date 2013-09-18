class Keyword < ActiveRecord::Base
  has_many :taggings
  has_many :articles, through: :taggings

  validates :name, presence: true
end
