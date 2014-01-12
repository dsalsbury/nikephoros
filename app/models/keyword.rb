class Keyword < ActiveRecord::Base
  has_many :taggings
  has_many :articles, through: :taggings, source: :document, source_type: 'Article'
  has_many :supplements, through: :taggings, source: :document, source_type: 'Supplement'

  validates :name, presence: true
end
