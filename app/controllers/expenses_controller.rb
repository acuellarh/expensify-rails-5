class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @categories = Category.all
  end



end
