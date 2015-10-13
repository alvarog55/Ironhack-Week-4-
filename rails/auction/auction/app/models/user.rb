class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	has_many :products
	def self.order_alph
		all.order('name ASC')
	end
end
