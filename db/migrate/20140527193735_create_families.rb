class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.integer :main_person_id

      t.timestamps
    end
  end
end
