# encoding: UTF-8
class Post < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :asset, :asset2
	belongs_to :user

	validates_presence_of :title, :content

	paginates_per 5

  has_attached_file :asset,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:id_:style.:extension",
                    :url => "/system/:class/:attachment/:id/:id_:style.:extension",
                    :whiny => false

  has_attached_file :asset2,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:id_:style.:extension",
                    :url => "/system/:class/:attachment/:id/:id_:style.:extension",
                    :whiny => false

	def hit
		self.increment!(:hits_count)
	end

	def owned_by?(u)
		u && self.user_id == u.id
	end
end
