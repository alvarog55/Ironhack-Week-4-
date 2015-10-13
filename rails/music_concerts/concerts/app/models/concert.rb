class Concert < ActiveRecord::Base
	validates :band, presence: true, uniqueness: true
	validates :venue, presence: true, uniqueness: true
	validates :city, presence: true, uniqueness: true
	validates :datetime, presence: true
	validates :price, presence: true, uniqueness: true
	validates :description, presence: true, uniqueness: true
	def self.order_alph
		all.order('band ASC')
	end
end
