# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#	 cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#	 Mayor.create(name: 'Emanuel', city: cities.first)

#Place.create!(:name => "ShangXuan", :category => 1, :locationx => 2.3, :locationy => 2.5, :intro => "heidian")

Placeclassify.create!(:name1 => "餐厅", :name2 => "食堂", :instruction => "", :imagename => "dininghall.png")
Placeclassify.create!(:name1 => "理发店", :name2 => "美发店", :instruction => "", :imagename => "barbershop.png")
Placeclassify.create!(:name1 => "教学楼", :instruction => "building.png")
Placeclassify.create!(:name1 => "公寓", :name2 => "寝室", :name3 => "宿舍", :instruction => "dormitory.png")
Placeclassify.create!(:name1 => "快递", :instruction => "", :imagename => "express.png")
Placeclassify.create!(:name1 => "打印店", :name2 => "打印社", :instruction => "printstore.png")
Placeclassify.create!(:name1 => "超市", :name2 => "便利店", :instruction => "supermarket.png")
Placeclassify.create!(:name1 => "图书馆", :instruction => "library.png")
Placeclassify.create!(:name1 => "电影院", :instruction => "cinema.png")

=begin
学苑楼
学士楼
友来餐厅
美食长廊
饺子园餐厅
正心楼
格物楼
诚意楼
致知楼
十八公寓
一公寓
二公寓
七公寓
学子超市
=end
