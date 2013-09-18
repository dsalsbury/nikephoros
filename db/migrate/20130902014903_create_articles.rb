class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :volume, index: true
      t.string     :title
      t.integer    :first_page
      t.string     :other_pages
      t.attachment :pdf

      t.timestamps
    end
  end
end
