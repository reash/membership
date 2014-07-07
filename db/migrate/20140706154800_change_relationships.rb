class ChangeRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :language, :string
    add_column :relationships, :sort_order, :integer
  end
end
