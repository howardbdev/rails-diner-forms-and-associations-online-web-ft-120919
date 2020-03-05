class MenusController < ApplicationController

  # get "/menus/new"
  def new
    @menu = Menu.new
  end

  # post "/menus"
  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to menu_path(@menu)
    else
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  private

  def menu_params
    params.require(:menu).permit(:name, items_attributes: [:price, :name, :description])
  end
end
