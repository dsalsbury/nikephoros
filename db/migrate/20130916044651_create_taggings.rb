class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :keyword, index: true
      t.belongs_to :article, index: true

      t.timestamps
    end
  end
end
