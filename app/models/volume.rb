class Volume < ActiveRecord::Base
  has_many :articles

  validates :number, presence: true
  validates :year, presence: true
end
