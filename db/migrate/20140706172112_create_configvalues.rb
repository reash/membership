class CreateConfigvalues < ActiveRecord::Migration
  def change
    create_table :configvalues do |t|
      t.string :name
      t.string :value
      t.date :dvalue
      t.integer :ivalue
      t.float :fvalue
      t.timestamps
    end
  end
end
