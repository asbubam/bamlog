class AssetToPosts < ActiveRecord::Migration
  def up
		add_column 	:posts, :asset_file_name, :string
		add_column	:posts,	:asset_content_type, :string
		add_column 	:posts, :asset_file_size, :integer
 
 		add_column 	:posts, :asset2_file_name, :string
		add_column	:posts,	:asset2_content_type, :string
		add_column 	:posts, :asset2_file_size, :integer
 end

  def down
 		remove_column 	:posts, :asset_file_name
		remove_column		:posts,	:asset_content_type
		remove_column 	:posts, :asset_file_size
 
 		remove_column 	:posts, :asset2_file_name
		remove_column	:posts,	:asset2_content_type
		remove_column 	:posts, :asset2_file_size
 end
end
