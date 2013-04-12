# encoding: UTF-8
class User < ActiveRecord::Base
  attr_accessible :login, :password, :password_confirmation, :name, :salt, :level
	attr_accessor :password_confirmation

	validates_presence_of	 		:login, 		:message => "로그인 아이디를 입력해주세요."
	validates_uniqueness_of 	:login, 		:message => "이미 사용 중인 아이디입니다."
	validates_presence_of 		:password, 	:message => "비밀번호를 입력해주세요.", :on => :create
	
	validates_confirmation_of :password, 	:message => "비밀번호가 일치하지 않습니다."

	before_save :salting_password

	def self.authenticate(_login, _pw)
		u = find_by_login(_login)
		u && u.password == Digest::SHA1.hexdigest("#{_pw}:#{u.salt}") ? u:nil
	end

	protected
		def salting_password
			return unless self.changes.include?('password')
			self.salt = Digest::MD5.hexdigest(Time.now.to_f.to_s)
			self.password = Digest::SHA1.hexdigest("#{self.password}:#{self.salt}")
		end
end
