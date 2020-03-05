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

    @order = Order.new(
      customer_id: params[:order][:customer_id],
      item_ids: params[:order][:item_ids]
    )
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def show

  end


end
