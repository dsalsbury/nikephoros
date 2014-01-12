class CreateSupplements < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.string     :number
      t.string     :title
      t.integer    :pages
      t.text       :description
      t.attachment :pdf

      t.timestamps
    end
  end
end
