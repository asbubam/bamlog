class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
			t.integer	:user_id, :null => false, :default => 0

			t.string 	:title, :null => false
			t.text 		:content, :null => false
	
			t.integer :hits_count, :null => false, :default => 0
			t.integer :comment_count, :null => false, :default => 0
		
      t.timestamps
    end
  end
end
