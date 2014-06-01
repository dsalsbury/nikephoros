class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :volume, index: true
      t.string     :title
      t.integer    :first_page
      t.string     :other_pages
      t.string     :pdf_file_name
      t.string     :pdf_content_type
      t.string     :pdf_file_size
      t.string     :pdf_updated_at

      t.timestamps
    end
  end
end
