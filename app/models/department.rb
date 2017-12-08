class Department < ActiveRecord::Base
	has_many :feeds
	def create(name)
		@category = Category.new(name)
		if @category.save
			return @category
		else
			return @category
		end
	end

end
