class CreateUrl < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :host
      t.string :path

      t.timestamps null: false
    end
  end
end
