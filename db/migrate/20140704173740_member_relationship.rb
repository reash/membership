class MemberRelationship < ActiveRecord::Migration
  def change
    add_column :members, :relationship, :string
  end
end
