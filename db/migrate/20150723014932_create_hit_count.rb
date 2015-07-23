class CreateHitCount < ActiveRecord::Migration
  def change
    create_table :hit_counts do |t|
      t.references :url
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
