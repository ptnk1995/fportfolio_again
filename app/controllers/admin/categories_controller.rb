class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :create_category, only: [:index, :new]
  before_action :load_category, except: [:index, :new, :create]
  def index
    @categories = Category.all
  end

  def create
     @category = Category.new category_params
    if @category.save
      flash[:success] = t "create_success"
      redirect_to admin_categories_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".updated"
      redirect_to admin_categories_path
    else
      render :index
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    if @category.destroy
      flash[:success] = t "dashboard.holidays.form.delete_success"
    else
      flash[:warning] = t "dashboard.holidays.form.delete_not_success"
    end
    redirect_to admin_categories_path
  end

  def category_params
    params.require(:category).permit(:name, :target_type)
  end

  def create_category
    @category = Category.new
  end

  def load_category
    @category = Category.find_by(id: params[:id])
  end
end
