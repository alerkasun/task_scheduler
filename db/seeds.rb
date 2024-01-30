user = User.first || 
User.create(
  email: 'qwe@qwe.qwe', 
  password: 'qwe123qwe123', 
  password_confirmation: 'qwe123qwe123'
)

statuses = ['ToDo', 'InProgress', 'Done']

50.times do
  Task.create(
    title: Faker::Lorem.sentence(word_count: rand(1..3)),
    description: Faker::Lorem.sentence(word_count: rand(4..10)),
    due_date: Faker::Date.forward(days: rand(5..30)),
    status: statuses.sample,
    priority: rand(1..5),
    user: user
  )
end
