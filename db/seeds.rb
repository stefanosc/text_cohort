require 'faker'

3.times do
  list = List.create(name: Faker::Lorem.words(rand(1..3)).join(' '))
  rand(3..8).times do
    task = list.tasks.create(name: Faker::Lorem.words(rand(1..3)).join(' '))
    rand(1..3).times do
      task.tags.create(name: Faker::Lorem.word)
    end
  end
end
