class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource
  layout "admin"
  before_action :create_category, only: [:index, :new]

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
    params.require(:category).permit(:name, :target_type, :image)
  end

  def create_category
    @category = Category.new
  end
end
