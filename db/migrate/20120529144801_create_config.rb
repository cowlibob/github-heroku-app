class CreateConfig < ActiveRecord::Migration
  def up
  	create_table :heroku_applications do |t|
  		t.string :app_name
  		t.string :api_key
  		t.string :url
  	end
  	add_index :heroku_applications, :app_name
  end

  def down
  	drop_table :heroku_applications
  end
end
