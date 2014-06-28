class Family < ActiveRecord::Base
  belongs_to :main_person, class_name: "User", foreign_key: "main_person_id"
  has_many :members
end
