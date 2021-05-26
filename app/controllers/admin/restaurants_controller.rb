class Admin::RestaurantsController < ApplicationController
  before_action :if_not_admin

  def index
    @restaurants = Restaurant.all.order(created_at: :desc)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menu = Menu.new
    @menus = @restaurant.menus.includes(:restaurant)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    resetaurant = Restaurant.find(params[:id])
    resetaurant.destroy
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path
    else
      render :edit
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name,:area_id,:address,:genre_id,:opening_hours,:phone_number,:image).merge(user_id: current_user.id)
  end
end
