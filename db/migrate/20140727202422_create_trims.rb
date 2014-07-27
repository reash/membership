class CreateTrims < ActiveRecord::Migration
  def change
    create_table :trims do |t|
      t.string :name
      t.string :language
      t.string :value
      t.text :notes
      t.integer :creater
      t.integer :updater
      t.timestamps
    end
  end
end
