module CategoriesHelper
  def title_category
    @category.new_record? ? "Crear Categoria" : "Editar Categoria"  
  end
end
