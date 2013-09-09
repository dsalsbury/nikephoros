class Author < ActiveRecord::Base
  has_many :authorships
  has_many :articles, through: :authorships
end
