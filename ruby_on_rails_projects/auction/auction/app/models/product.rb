class Product < ActiveRecord::Base
	belongs_to :users
	def self.order_alph
		all.order('name ASC')
	end
end
