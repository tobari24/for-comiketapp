class ItemsController < ApplicationController
	def index
		@circle = Circle.find(params[:circle_id])
	end
	def create
		@circle = Circle.find(params[:circle_id])
		@item = @circle.items.create(item_params)
		redirect_to circle_path(@circle)
	end

	private
	def item_params
		params.require(:item).permit(:itemname, :price)
	end
end
