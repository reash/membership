class FamilyNotes < ActiveRecord::Migration
  def change
    add_column :families, :notes, :text
  end
end
