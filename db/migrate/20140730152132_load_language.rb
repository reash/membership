class LoadLanguage < ActiveRecord::Migration
  def up
    x = Language.new
    x.language = 'English'
    x.save!    
    x = Language.new
    x.language = 'Spanish'
    x.save!    
  end
  def down
    x = Language.destroy_all("language = 'English'")
    x = Language.destroy_all("language = 'Spanish'")
  end
end
