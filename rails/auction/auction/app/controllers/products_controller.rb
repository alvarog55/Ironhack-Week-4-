class ProductsController < ApplicationController
	def index
		@products = Product.order_alph
		@user = User.find(params[:user_id])

	end

	def show
		id = params[:id]
		@product = Product.find(id)

		if @product.nil?
			render :no_product_found
		else
			render :show
		end
	end

	def destroy
		product = Product.find(params[:id])
		product.destroy
		redirect_to products_path
	end

	def new
		@user = User.find(params[:user_id])
		@product = Product.new
		
	end

	def create
		id = params[:user_id]
		@product = Product.new(product_params)
		@product.user_id = id
		if @product.save
			flash[:notice] = "Product created succesfully"
			redirect_to user_path(id)
		else
			render :new
		end
	end

	def product_params
		params.require(:product).permit(:name, :description, :deadline)
	end
end
