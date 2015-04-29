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
Category.create(name: '其他')



Major.create(name: '计算机科学与技术')
Major.create(name: '软件工程')
Major.create(name: '数学与应用数学')
Major.create(name: '国际经济与贸易')
Major.create(name: '公共事业管理')
Major.create(name: '历史学')
Major.create(name: '英语')
Major.create(name: '哲学')
Major.create(name: '微电子科学与工程')
Major.create(name: '环境工程')
Major.create(name: '生物工程')


Grade.create(name: '2011级')
Grade.create(name: '2012级')
Grade.create(name: '2013级')
Grade.create(name: '2014级')
			  