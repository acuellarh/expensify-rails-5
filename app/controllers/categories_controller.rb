class CategoriesController < ApplicationController
  before_action :current_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order(created_at: :asc) 
  end  
  
  def new
      @category = Category.new
  end

  def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to categories_path
        flash[:notice] = "Categoria creada satisfactoriamente"        
      else
        render :new
      end  
  end

  def edit      
  end

  def update    
    if  @category.update(category_params)
      flash[:notice] = "Categorias actualizada satisfactoriamente"
      redirect_to categories_path(@category)
    else
      render :edit
    end    
  end

  def destroy
    if @category.destroy
      flash[:notice] = "categoria eliminada satisfactoriamente" 
      redirect_to categories_path
    end
  end



  private

  def category_params
    params.require(:category).permit(:name)
  end  

  def current_category    
    @category = Category.find(params[:id])
  end  

end
