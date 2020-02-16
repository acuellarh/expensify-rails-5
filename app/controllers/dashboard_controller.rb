class DashboardController < ApplicationController
  def index
    @tab = :dashboard

    #total 
    @all_expenses_data = Type.all.map do |type|
       {name: type.name, data: Expense.where(type_id: type.id).group_by_year(:date).sum(:amount)} 
    end
    
    #total by category        
    @type_title = Type.all.map do |type| type.name end
    @category_sum = Type.all.map do |type| Expense.where(type_id: type.id).sum(:amount) end   
    
    @category_data = Hash.new  
    @type_title.length.times do |index|
      @category_data[@type_title[index]] = @category_sum[index] 
    end  

    @category_all_data = @category_data
    #end total by category  
    
    @today = Expense.total(Expense.today)
    @yesterday = Expense.total(Expense.yesterday)
    @this_month = Expense.total(Expense.month(Date.current))
    @last_month = Expense.total(Expense.last_month)
    
  end


end
