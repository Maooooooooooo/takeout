class Admin::MenusController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy,:create,:update]
  before_action :if_not_admin
  before_action :set_restaurant, only[:edit,:update]
  before_action :restaurant_params,only[:edit,:destroy]

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

  def edit
  end

  def update
    if @menu.update(menus_params)
      redirect_to restaurant_menu_path
    else
      render :edit
    end
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to restaurant_path(@restaurant.id)
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def menus_params
    params.require(:menu).permit(:food_name,:price,:explanation,:image).merge(restaurant_id:params[:restaurant_id])
  end 

  def set_restaurant
    @menu = Menu.find(params[:id])
  end

  def restaurant_params
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
