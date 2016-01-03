class Comment < ActiveRecord::Base
	def self.search(query)
  		where("article_id = ?", "#{query}") 
	end
	def self.search1(query)
		where("article_id = ?","#{query}")
	end
end
