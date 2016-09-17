class Feed < ActiveRecord::Base
	belongs_to :department
	validates_presence_of :title
	# validates_presence_of :description
end
