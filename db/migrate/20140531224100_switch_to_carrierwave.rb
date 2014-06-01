class SwitchToCarrierwave < ActiveRecord::Migration
  def change
    remove_column :articles, :pdf_file_name
    remove_column :articles, :pdf_content_type
    remove_column :articles, :pdf_file_size
    remove_column :articles, :pdf_updated_at

    remove_column :supplements, :pdf_file_name
    remove_column :supplements, :pdf_content_type
    remove_column :supplements, :pdf_file_size
    remove_column :supplements, :pdf_updated_at

    add_column    :articles, :pdf, :string
    add_column    :supplements, :pdf, :string
  end
end
