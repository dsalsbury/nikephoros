class Volume < ActiveRecord::Base
  has_many :articles

  validates :number, presence: true
  validates :year, presence: true

  def self.sort_by_number_asc
    reorder('CAST(volumes.number AS INTEGER) ASC')
  end

  def self.sort_by_number_desc
    reorder('CAST(volumes.number AS INTEGER) DESC')
  end
end
