class BitesController < ApplicationController

	before_action :authenticate_user
	before_action :set_bite, only: [:edit, :update, :show, :destroy]

	def index
		@bites = Bite.all
	end

	def show
	end

	def new
		@bite = Bite.new
	end

	def create
		@bite = Bite.new(bite_params)
		if @bite.save
			redirect_to bites_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @bite.update(bite_params)
			redirect_to bite_path(@Bite)
		else
			render 'edit'
		end
	end

	def destroy
		@bite.destroy
		redirect_to bites_path
	end

	private

	def bite_params
		params.require(:bite).permit(:chef, :bite)
	end

	def set_bite
		@bite = Bite.find(params[:id])
	end

end
