# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(name: '电子商品')
Category.create(name: '书本文具')
Category.create(name: '体育用品')
Category.create(name: '音乐乐器')
Category.create(name: '寝室用品')
Category.create(name: '服装服饰')



Major.create(name: '计算机科学与技术')
Major.create(name: '软件工程')

Grade.create(name: '2011级')
Grade.create(name: '2012级')
Grade.create(name: '2013级')
Grade.create(name: '2014级')
			  