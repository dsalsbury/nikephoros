class Article < ActiveRecord::Base
  belongs_to :volume

  validates :title, presence: true
  validates :date, presence: true
end
