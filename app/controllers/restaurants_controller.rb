class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.order(created_at: :desc)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menu = Menu.new
    @menus = @restaurant.menus.includes(:restaurant)
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name,:area_id,:address,:genre_id,:opening_hours,:phone_number,:image).merge(user_id: current_user.id,menu_id: menu.id)
  end
end
