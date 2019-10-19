# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Type.delete_all

# Type.create ([
#   {name: 'Purchase'},
#   {name: 'Widthdraw'},
#   {name: 'Transfer'},
#   {name: 'Payment'},
# ])


Expense.delete_all
20.times do
  Expense.create(
    user_id: [1,34].sample,
    #type_id: Faker::Number.between(from: 1, to: 4),
    type_id: [1,2,3,4].sample,
    #category_id: Faker::Number.between(from: 1, to: 4),
    category_id: [1,2,3,4].sample,
    #amount: Faker::Commerce.price(range: 0..100000.0),    
    amount: [100, 200, 250, 400, 100].sample,        
    concept: Faker::Lorem.sentence,
    date: Faker::Date.between(6.months.ago, Date.today.end_of_month)
  )
end
