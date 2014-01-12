class Tagging < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :document, polymorphic: true
end
