class Supplement < ActiveRecord::Base
  has_many :authorships, as: :document
  has_many :authors, through: :authorships
  has_many :taggings, as: :document
  has_many :keywords, through: :taggings

  has_attached_file :pdf, url: '/system/pdfs/:filename', default_url: nil

  validates :title, presence: true
  validates :number, presence: true
  validates :pages, presence: true
  validates :description, presence: true
  validates_attachment :pdf, content_type: { content_type: 'application/pdf' }
end
