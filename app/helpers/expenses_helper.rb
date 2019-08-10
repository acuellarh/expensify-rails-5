module ExpensesHelper
  def title_expense
    @expense.new_record? ? "Crear Gasto" : "Editar Gasto"  
  end
end
