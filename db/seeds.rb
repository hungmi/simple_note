# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless (@user = User.first).present?
	@user = User.create(name: "test", password: "123456")
end

@first_notebook = Notebook.create({
	name: "生活賬本"
})

10.times do |i|
	@first_notebook.payments.create({
		total: rand(100..10000),
		recorder: @user
	})
end