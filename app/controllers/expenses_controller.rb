class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @expense = Expense.all
    @categories = Category.all
  end

  def new
    @expense = Expense.new
  end

  def create
    
  end



end
