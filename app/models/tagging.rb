class Tagging < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :article
end
