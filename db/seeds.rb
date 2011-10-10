# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Member.delete_all

Member.create(
	:first_name => 'Neftali',
	:last_name => 'Alverio',
	:email => 'nalverio@gmail.com',
	:password => 'password',
	:street_line_1 => '555 Boston Rd.',
	:street_line_2 => '',
	:city => 'Woodbridge',
	:state => 'CT',
	:zip => '06655')

Member.create(
	:first_name => 'Vimarys',
	:last_name => 'Alverio',
	:email => 'valverio@gmail.com',
	:password => 'password',
	:street_line_1 => '555 Main St.',
	:street_line_2 => 'Apt #5',
	:city => 'Fairfield',
	:state => 'CT',
	:zip => '06612')

