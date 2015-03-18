class ItemsController < ApplicationController
	before_action :set_item, only: [:show]
	def index
		@circle = Circle.find(params[:circle_id])
	end
	def create
		@circle = Circle.find(params[:circle_id])
		@item = @circle.items.create(item_params)
		redirect_to circle_path(@circle)
		flash[:notice] = '登録しました。'
	end
	def show
	end

	private
	def item_params
		params.require(:item).permit(:itemname, :price,)
	end
	def set_item
		@item = Item.find(params[:id])
		@user_id = current_user.id 
	end
end
