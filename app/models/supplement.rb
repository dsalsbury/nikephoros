class Supplement < ActiveRecord::Base
  mount_uploader :pdf, PdfUploader

  has_many :authorships, as: :document
  has_many :authors, through: :authorships
  has_many :taggings, as: :document
  has_many :keywords, through: :taggings

  validates :title, presence: true
  validates :number, presence: true
  validates :pages, presence: true
  validates :description, presence: true
end
