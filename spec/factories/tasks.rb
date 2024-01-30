FactoryBot.define do
    factory :task do
      title { "Test Task" }
      due_date { Date.tomorrow }
      priority { 5 }
      status { "ToDo" }
      user
    end
  end
  