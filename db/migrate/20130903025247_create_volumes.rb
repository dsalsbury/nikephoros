class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.string :number
      t.string :year
      t.string :isbn

      t.timestamps
    end
  end
end
