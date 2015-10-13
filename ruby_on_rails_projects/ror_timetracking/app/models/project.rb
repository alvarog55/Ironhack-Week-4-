class Project < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true, length: { minimum: 4 }
	
	has_many :entries
	def self.iron_find(num)
		all.where(id: num)
	end

	def self.ordered_alph
		all.limit(5).order("title ASC")
	end

	def self.clean_old
		where("created_at < ?", 2.hours.ago).destroy_all
	end

	def self.last_updated(num)
		all.limit(10).order("updated_at DESC")
	end
end
