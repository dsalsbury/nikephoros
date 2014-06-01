class CreateSupplements < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.string     :number
      t.string     :title
      t.integer    :pages
      t.text       :description
      t.string     :pdf_file_name
      t.string     :pdf_content_type
      t.string     :pdf_file_size
      t.string     :pdf_updated_at

      t.timestamps
    end
  end
end
