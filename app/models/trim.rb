class Trim < ActiveRecord::Base
  def <=> (other)
    name <=> other.name
  end
  def self.trimit(name)
    Trim.where("name = '#{name}'").first.value
  end
end
