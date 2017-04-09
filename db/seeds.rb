# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


   14.times { |i| Feed.create(title: "Feed #{i+1}", description: "description #{i+1}", department_id:"#{(i+1)%5}")}
   8.times { |i| Department.create(name:"dept:#{i+1}")}