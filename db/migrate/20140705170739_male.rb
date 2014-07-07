class Male < ActiveRecord::Migration
  def change
    add_column :members, :male, :boolean, :null => false
  end
end
