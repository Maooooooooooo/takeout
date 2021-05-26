class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end
  
  def show
    @menu = Menu.find(params[:id])
  end

  private
  def menus_params
    params.require(:menu).permit(:food_name,:price,:explanation,:image).merge(restaurant_id: restaurant.id)
  end 
end
