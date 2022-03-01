class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update destroy]
  
  def index
    @categories = Category.all
    @tasks = Task.all
  end

  def new
  end

  def create
    # @category = Category.new(category_data)
    @category = current_user.categories.build(category_data)
    if @category.save
      redirect_to categories_path, notice: 'Category successfully added.'
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_data)
      redirect_to categories_path, notice: 'Category successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    else
      render :index
    end
  end

  def correct_user
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to categories_path, notice: 'Not Authorized to do this action.' if @category.nil?
  end

  private

  def category_data
    params.require(:category).permit(:category_name, :category_body, :user_id)
  end
end