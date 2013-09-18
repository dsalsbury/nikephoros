class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.integer :number
      t.integer :year
      t.string  :isbn

      t.timestamps
    end
  end
end
