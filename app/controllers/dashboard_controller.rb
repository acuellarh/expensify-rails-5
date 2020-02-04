class DashboardController < ApplicationController
  def index
    @tab = :dashboard

    #total 
    @column_data = Type.all.map do |type|
       {name: type.name, data: Expense.where(type_id: type.id).group_by_year(:date).sum(:amount)} 
    end
    
    #total by category
    #Type.all.map do |type|  { name: type.name, data: Expense.where(type_id: type.id).sum(:amount)}  end      
    @type_title = Type.all.map do |type| type.name end
    @category_sum = Type.all.map do |type| Expense.where(type_id: type.id).sum(:amount) end   
    
    @category_data = Hash.new  
    @type_title.length.times do |index|
      @category_data[@type_title[index]] = @category_sum[index] 
    end  

    @category_full_data = @category_data  
    
  end


end
