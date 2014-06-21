require_relative '../config/application.rb'
require 'faker'
require 'date'

# Random date functions to be used in record creation

def random_task_due_date
  Date.today +(25*rand())
end

def random_list_due_date
  Date.today +(100*rand())
end

# Create Lists, Tasks, & Tags

10.times do
  Lists.create(
    name: Faker::Lorem.words(rand(1..2)).join(" "),
    description: Faker::Lorem.words(rand(4..10)).join(" "),
    due_by: random_list_due_date
  )
end

100.times do
  Tasks.create(
    name: Faker::Lorem.words(rand(1..2)).join(" "),
    description: Faker::Lorem.words(rand(4..10)).join(" "),
    due_by: random_task_due_date,
    list_id: rand(1..10)
  )
end

30.times do
  Tags.create(
    name: Faker::Lorem.words(rand(1..2)).join(" "),
    description: Faker::Lorem.words(rand(4..10)).join(" ")
  )
end

# Apply tags to Lists & Tasks

Tasks.all.each do |task|
  TasksTag.create(task_id: task.id, tag_id: rand(1..30))
end

Lists.all.each do |list|
  ListsTag.create(list_id: list.id, tag_id: rand(1..30))
end