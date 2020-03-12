class ExpensesController < ApplicationController
  before_action :current_expense, only: [:edit, :update, :destroy]

 
  has_scope :expense_type_id, type: :array
  has_scope :expense_category_id, type: :array  

  def index
    @tab = :expenses
    @month_list = Expense.extract_month_list.reverse!
    @first_month_date = @month_list.first
    # @month_value =  params[:month].present? ? Date.parse(params[:month]) : Date.parse(@first_month_date)    
    @type_id =  params[:type_id].present? ? params[:type_id] : [1,2,3,4]
    @category_id =  params[:category_id].present? ? params[:category_id] : [1,2,3,4]
    # @expenses = Expense.expense_type_id(@type_id).expense_category_id(@category_id).filter_month(@month_value)    
    # @expenses = Expense.expense_type_id(@type_id).expense_category_id(@category_id).month(@month_value)    
    @expenses = Expense.expense_type_id(@type_id).expense_category_id(@category_id)   
    @total = Expense.expense_type_id(@type_id).expense_category_id(@category_id).total(@expenses)
    @expenses = @expenses.order(date: :asc)
    @num_transactions = @expenses.count 
    # if @num_transactions == 0
    #   @average = 0
    # else
    #   @average = @total / @num_transactions
    # end  

    @average = @num_transactions == 0 ? 0 : @total / @num_transactions
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params_expenses)

    respond_to do |format|
      if @expense.save      
        redirect_to expenses_path      
        flash[:notice] = "Gasto creado satisfactoriamente"
        format.json { head :no_content }
        format.json {render json: @expense }
        format.js  # Index.js.erb    
      else
        format.json {render json: @expense.errors.full_messages,
                            status: :unprocessable_entity}
      end      
    end  
  end

  def edit    
  end 
  
  def update
    respond_to do |format|
      if  @expense.update(params_expenses)              
        format.json { head :no_content }
        format.js
        redirect_to expenses_path(@expense)  
        flash[:notice] = "Gasto actualizado satisfactoriamente"     
      else        
        format.json {render json: @expense.errors.full_messages,
          status: :unprocessable_entity}          
      end
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
