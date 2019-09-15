class ExpensesController < ApplicationController
  before_action :current_expense, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @expense.save
        format.json { head :no_content }
        format.js
      else
        format.json {render json: @expense.errors.full_messages,
                            status: :unprocessable_entity}
      end      
    end  
  end

  def edit    
  end 
  
  def update    
    if  @expense.update(params_expenses)
      flash[:notice] = "Gasto actualizado satisfactoriamente"
      redirect_to expenses_path(@expense)
    else
      render :edit
    end    
  end


  def destroy
    if @expense.destroy
      flash[:notice] = "Gasto eliminado satisfactoriamente"
      redirect_to expenses_path
    end      
  end

  private

  def params_expenses
    params.require(:expense).permit(:id, :type_id, :date, :concept, :category_id, :amount).merge(user: current_user)
  end

  def current_expense
    @expense = Expense.find(params[:id])
  end  

end
