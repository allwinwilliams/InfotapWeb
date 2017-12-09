class Feed < ActiveRecord::Base
	belongs_to :department
	validates_presence_of :title
	# validates_presence_of :description
	def self.search(search)
	  if search
			find_by_sql(
				"(select * from feeds where department_id in
					(select id from departments
					where name like \"%"+search+"%\"))
				union
					(select * from feeds where title like \"%"+search+"%\")
				union
					(select * from feeds where description like \"%"+search+"%\")
				order by updated_at desc;"
			)
	  else
	    find(:all).order({ updated_at: :desc })
	  end
	end
	def self.get_department_name()
		Department.find(department_id).name
	end
end
