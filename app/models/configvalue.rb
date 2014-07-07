class Configvalue < ActiveRecord::Base
  def <=> (other)
    sort_order <=> other.sort_order
  end
  def self.language
    Configvalue.where("name = 'Language'").first.value
  end
end
