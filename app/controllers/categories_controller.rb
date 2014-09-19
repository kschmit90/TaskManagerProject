class CategoriesController < ApplicationController
  skip_before_filter :authorize
  @@cat_create = "Category has been created."
  @@cat_update = "Category has been updated."
  @@cat_destroy = "Category has been deleted."

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to category_path(@category.id), :notice => @@cat_create
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])

    @tasks = Task.all
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to category_path(@category.id), :notice => @@cat_update
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])

    redirect_to dashboard_path, :notice => @@cat_destroy
  end
end
