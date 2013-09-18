class Article < ActiveRecord::Base
  belongs_to :volume

  has_many :authorships
  has_many :authors, through: :authorships
  has_many :taggings
  has_many :keywords, through: :taggings

  has_attached_file :pdf, url: '/system/pdfs/:filename', default_url: nil

  validates :title, presence: true
  validates :volume, presence: true

  def keyword_names=(val)
    names = val.split(/,\s*/)
    self.keywords = names.map { |name| Keyword.where(name: name).first_or_create }
  end

  def keyword_names
    keywords.pluck(:name).join(',')
  end
end
