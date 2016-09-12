class Feed < ActiveRecord::Base
	belongs_to :department
	validates_presence_of :title
end
