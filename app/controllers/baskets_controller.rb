class BasketsController < ApplicationController

	# add something to our basket

	def create


		# find the product from our url
		@product = Product.find(params[:product_id])

		# then add it to our basket
		basket.add(@product.id)

		flash[:success] = "Added #{@product.title} to basket"

		redirect_to product_path(@product)

	end

	# remove something from our basket

	def destroy

		# find the product from our url
		@product = Product.find(params[:product_id])

		# then add it to our basket
		basket.delete(@product.id)

		flash[:error] = "Removed #{@product.title} from basket"

		redirect_to product_path(@product)


	end


end
