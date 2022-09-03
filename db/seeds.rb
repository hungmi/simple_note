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