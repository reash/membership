class LoadRelationships < ActiveRecord::Migration
  def change
    x = Relationship.new
    x.relationship = 'Husband'
    x.language = 'English'
    x.sort_order = 1
    x.save!
    x = Relationship.new
    x.relationship = 'Wife'
    x.language = 'English'
    x.sort_order = 10
    x.save!
    x = Relationship.new
    x.relationship = 'Son'
    x.language = 'English'
    x.sort_order = 20
    x.save!
    x = Relationship.new
    x.relationship = 'Daughter'
    x.language = 'English'
    x.sort_order = 30
    x.save!
    x = Relationship.new
    x.relationship = 'Father'
    x.language = 'English'
    x.sort_order = 40
    x.save!
    x = Relationship.new
    x.relationship = 'Mother'
    x.language = 'English'
    x.sort_order = 50
    x.save!
    x = Relationship.new
    x.relationship = 'Grandmother'
    x.language = 'English'
    x.sort_order = 60
    x.save!
    x = Relationship.new
    x.relationship = 'Grandfather'
    x.language = 'English'
    x.sort_order = 70
    x.save!
    x = Relationship.new
    x.relationship = 'Great Grandmother'
    x.language = 'English'
    x.sort_order = 80
    x.save!
    x = Relationship.new
    x.relationship = 'Great Grandfather'
    x.language = 'English'
    x.sort_order = 90
    x.save!
  end
end
