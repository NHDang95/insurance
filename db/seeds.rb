# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create(id: "3", name: "Bảo hiểm", created_at: "2020-09-29", updated_at: "2020-09-29")
Product.create(id: "4", parent_id: "3", name: "Bảo hiểm sức khỏe", created_at: "2020-09-29", updated_at: "2020-09-29")
Product.create(id: "5", parent_id: "3", name: "Bảo hiểm xe cơ giới", created_at: "2020-09-29", updated_at: "2020-09-29")


5.times do 
	Brand.create(name: "Hãng xe", created_at: "2020-09-28", updated_at: "2020-09-28")
	Usage.create(name: "Mục đích", created_at: "2020-09-28", updated_at: "2020-09-28")
	Modelyear.create(name: "Đời xe", created_at: "2020-09-28", updated_at: "2020-09-28")
	Group.create(name: "Nhóm xe", created_at: "2020-09-28", updated_at: "2020-09-28")
	Type.create(name: "Loại xe", brand_id: "1", group_id: "1", usage_id: "1", created_at: "2020-09-28", updated_at: "2020-09-28")
end

10.times do 
	Article.create(
		title: "Article title",
		text: "Article content", 
		created_at: "2020-09-28", 
		updated_at: "2020-09-28", 
		description: "Article description" 
	)
end