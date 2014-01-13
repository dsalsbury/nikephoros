class Article < ActiveRecord::Base
  belongs_to :volume

  has_many :authorships, as: :document
  has_many :authors, through: :authorships
  has_many :taggings, as: :document
  has_many :keywords, through: :taggings

  has_attached_file :pdf, url: '/system/pdfs/:filename', default_url: nil

  validates :title, presence: true
  validates :volume, presence: true
  validate :pages_format

  def pages=(pages_str)
    @pages = pages_str
    self.first_page, self.other_pages = split_pages(pages_str) unless pages_str.blank?
  end

  def pages
    [first_page.to_s, other_pages.to_s].join
  end

  def keyword_names=(val)
    names = val.split(/,\s*/)
    self.keywords = names.map { |name| Keyword.where(name: name).first_or_create }
  end

  def keyword_names
    keywords.pluck(:name).join(',')
  end

  def self.sort_by_volume_number_and_first_page
    reorder('volumes.number DESC, articles.first_page ASC').references(:volume)
  end

  def self.sort_by_volume_number_asc
    includes(:volume).reorder('volumes.number ASC')
  end

  def self.sort_by_volume_number_desc
    includes(:volume).reorder('volumes.number DESC')
  end

  private

  def pages_format
    unless pages.blank? || @pages =~ /\A\d+\s*([-,]\s*\d+\s*)*\z/
      errors.add(:pages, 'must be a series of page numbers separated by "," or "-"')
    end
  end

  def split_pages(pages_str)
    parts = pages_str.gsub(' ', '').split(/(-|,)/)
    [parts[0], parts[1..-1].join]
  end
end
