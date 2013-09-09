class Article < ActiveRecord::Base
  belongs_to :volume
  has_many :authorships
  has_many :authors, through: :authorships

  has_attached_file :pdf

  validates :title, presence: true
  validates :volume, presence: true
end
