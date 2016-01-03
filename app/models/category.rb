class Category < ActiveRecord::Base
    has_many :articles

    def self.search_owner(query)
  		where("owner = ?", "#{query}") 
	end
end
