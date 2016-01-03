class Old < ActiveRecord::Base
	def self.search(query)
  		where("articles_id = ?", "#{query}") 
	end
end
