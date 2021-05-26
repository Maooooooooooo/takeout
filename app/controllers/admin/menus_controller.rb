class Admin::MenusController < ApplicationController
  before_action :if_not_admin
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.create(menus_params)
    if @menu.save
      redirect_to   restaurant_path(@menu.restaurant)
    else
      render :new
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def menus_params
    params.require(:menu).permit(:food_name,:price,:explanation,:image).merge(restaurant_id:params[:restaurant_id])
  end 
end
