# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  date        :date
#  amount      :decimal(, )
#  concept     :string
#  type_id     :integer
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  
  # # This is the Happy path, where all is ok, based on that you can make the rest of the test.

  # test 'valid expense' do 
    
  #   type = Type.first
  #   category = Category.first
  #   user = User.first
  #   concept = "String test"
  #   amount = 10000
  #   date = Date.current  
    
  #   expense = Expense.new(type: type, category: category, user: user, date: date, amount: amount, concept: concept)
  #   assert expense.valid?
  # end
  
  test 'should not save expense without concept' do     
    type = Type.first
    category = Category.first
    user = User.first
    
    expense = Expense.new(type: type, category: category, user: user)
    assert_not expense.save, "Saved the expense without a concept"
  end
  
  test 'should not save expense without amount' do     
    type = Type.first
    category = Category.first
    user = User.first
    concept = "String test"  
    
    expense = Expense.new(type: type, category: category, user: user, concept: concept)
    assert_not expense.save, "Saved the expense without an amount"
  end
  
  test 'should not save expense without date' do     
    type = Type.first
    category = Category.first
    user = User.first
    concept = "String test"
    amount = 10000 
    
    expense = Expense.new(type: type, category: category, user: user, concept: concept, amount: amount)
    assert_not expense.save, "Saved the expense without date"
  end
  
  
  
end
