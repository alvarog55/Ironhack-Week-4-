class ConcertsController < ApplicationController
	def home
		@concerts = Concert.limit(6).order("created_at DESC")
		@concerts_month = Concert.limit(14).order("created_at ASC")

	end

	def index
		@concerts = Concert.order_alph

	end

	def show
		id = params[:id]
		@concert = Concert.find(id)

		if @concert.nil?
			render :no_concert_found
		else
			render :show
		end
	end

	def new
		@concert = Concert.new
		render :new
	end

	def create
		@concert = Concert.new(concert_params)
		if @concert.save
			flash[:notice] = "Concert created succesfully"
			redirect_to concert_path(@concert)
		else
			render :new
		end
	end

	def concert_params
		params.require(:concert).permit(:band, :venue, :city, :datetime, :price, :description)
	end
end
