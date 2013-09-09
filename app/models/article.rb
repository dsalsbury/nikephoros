class Article < ActiveRecord::Base
  belongs_to :volume

  validates :title, presence: true
end
