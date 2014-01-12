class Author < ActiveRecord::Base
  has_many :authorships
  has_many :articles, through: :authorships, source: :document, source_type: 'Article'
  has_many :supplements, through: :authorships, source: :document, source_type: 'Supplement'
end
