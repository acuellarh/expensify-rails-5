# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Type.delete_all

Type.create ([
  {name: 'Purchase'},
  {name: 'Widthdraw'},
  {name: 'Transfer'},
  {name: 'Payment'},
])

Category.delete_all

Category.create ([
  {name: 'Leisure'},
  {name: 'Nutrition'},
  {name: 'Transport'},
  {name: 'Rent'},
])

Expense.delete_all
200.times do
  Expense.create(
    user_id: [1,2].sample,
    type_id: Faker::Number.between(1,4),  
    category_id: Faker::Number.between(1,4),           
    amount: Faker::Commerce.price(0..100000.0),           
    concept: Faker::Lorem.sentence,
    date: Faker::Date.between(6.months.ago, Date.today.end_of_month)
  )
end
