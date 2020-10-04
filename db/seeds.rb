# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do 
	Brand.create(name: "Hãng xe", created_at: "2020-09-28", updated_at: "2020-09-28")
	Usage.create(name: "Mục đích", created_at: "2020-09-28", updated_at: "2020-09-28")
	Modelyear.create(name: "Đời xe", created_at: "2020-09-28", updated_at: "2020-09-28")
	Group.create(name: "Nhóm xe", created_at: "2020-09-28", updated_at: "2020-09-28")
	Type.create(name: "Loại xe", brand_id: "1", group_id: "1", usage_id: "1", created_at: "2020-09-28", updated_at: "2020-09-28")
end

10.times do 
	Article.create(
		title: "Bảo hiểm tai nạn lao động - Bảo hiểm Bảo Việt",
		text: "BẢO HIỂM TAI NẠN LAO ĐỘNG - BAOVIET ACCIDENTCARE: Hiện nay theo quy định của nhà nước nhiều lĩnh vực kinh doanh và ngành nghề phải mua bảo hiểm tai nạn lao động như: Công nhân xây dựng, công nhân làm việc trong môi trường có mức độ nguy hiểm cao,....và do nhu cầu cũng như để đảm bảo an toàn và người lao động yên tâm công tác và gắn bó với công ty. Gói bảo hiểm tai nạn lao động của Bảo Hiểm Bảo Việt đáp ứng được các yêu cầu đưa ra. Ưu điểm của gói này là: Mức phí cạnh tranh, mức trách nhiệm cao, thời gian cấp bảo hiểm nhanh chóng và giao tận nơi theo yêu cầu của khách hàng.", 
		created_at: "2020-09-28", 
		updated_at: "2020-09-28", 
		description: "Article description" 
	)
end