class Language < ActiveRecord::Migration
  def change
    x = Configvalue.new
    x.name = 'Language'
    x.value = 'English'
    x.save!
  end
end
