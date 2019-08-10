class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @expenses = Expense.all
    @categories = Category.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params_expenses)

    if @expense.save
      redirect_to expenses_path
    else
      render :new
    end      
  end

  private

  def params_expenses
    params.require(:expense).permit(:id, :type_id, :date, :concept, :category_id, :amount).merge(user: current_user)
  end



end
