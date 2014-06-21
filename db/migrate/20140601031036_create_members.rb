class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :family_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name

      t.timestamps
    end
  end
end
