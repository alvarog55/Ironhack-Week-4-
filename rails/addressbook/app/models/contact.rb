class Contact < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true, length: { minimum: 4 }, format: {with: /\A[A-Za-z0-9]+\z/}
	validates :address, presence: true
	validates :phone_number, length: { maximum: 10}, presence: true
	validates :email, length: {maximum: 20}, uniqueness: true, presence: true
	def self.order_alph
		all.order('name ASC')
	end
end

