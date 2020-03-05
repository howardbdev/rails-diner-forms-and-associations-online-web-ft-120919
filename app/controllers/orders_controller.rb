class OrdersController < ApplicationController
  def new
    @order = Order.new
    @customers = Customer.all
    @items = Item.all
  end

  def create
    # {
    #   "order"=>
    #     {"customer_id"=>"1",
    #       "order_item_ids"=>["", "1", "2"]},
    #       "commit"=>"Create Order",
    #       "controller"=>"orders",
    #       "action"=>"create"}

    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      @customers = Customer.all
      @items = Item.all
      render :new
    end
  end

  # get '/orders/:id'
  def show
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_id, item_ids: [])
  end

end
