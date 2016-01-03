class Article < ActiveRecord::Base
    belongs_to :user
    belongs_to :category

    def self.search(query)
  		where("title like ?", "%#{query}%") 
	end
	
	def self.search_category(query)
		where("category_id = ?", "#{query}")
	end
end

class ExampleSearch
  	include ActiveModel::Validations
  	include ActiveModel::Conversion
  	extend ActiveModel::Naming

  	attr_accessor :input

  	validates_presence_of :input
  	validates_length_of :input, :maximum => 50000

end
