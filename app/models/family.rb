class Family < ActiveRecord::Base
  belongs_to :main_person, class_name: "Member", foreign_key: "main_person_id"
  has_many :members
  def head_of_household
    if main_person_id 
      "#{main_person.first_name} #{main_person.last_name}"
    else
      "Not Assigned"
    end
  end
end
