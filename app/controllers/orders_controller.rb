class OrdersController < ApplicationController
	def index
		@item = Item.find(params[:item_id])
	end
	def create
		@item = Item.find(params[:item_id])
		@order = @item.orders.create(order_params)
		redirect_to item_path(@item)
		flash[:notice] = '登録しました。'
	
	end
	def groupchecklist
		@lists = Circle.items.orders.where("quantity not ?",nil)
		
	end
	private
	def order_params

		params.require(:order).permit(:quantity, :user_id)
	end
end
