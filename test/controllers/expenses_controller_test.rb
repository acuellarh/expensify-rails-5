require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @expense = expenses(:one)
  end

  test 'call format js' do
    headers = { 'accept' => 'text/javascript' }
    post expenses_url(@expense), headers: headers
    assert true
  end

  test 'update an expense by AJAX' do
    patch expense_url(Expense.last), params: { expense: { concept: 'updated' } },xhr: true
  end
    
end
  
