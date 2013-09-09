class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.belongs_to :article, index: true
      t.belongs_to :author, index: true

      t.timestamps
    end
  end
end
