class FitnessesController < ApplicationController
	def index
		@phr = Phr.find(params[:phr_id])
		@fitnesses = @phr.fitnesses.paginate(page: params[:page], per_page: 5)
	end

	def new
		@phr = Phr.find(params[:phr_id])
		@fitness = @phr.fitnesses.build
	end

	def create
		@phr = Phr.find(params[:phr_id])
		@fitness = @phr.fitnesses.build(fitness_params)

		if @fitness.save
	    	flash[:success] = "Fitness Record Created!"
    		redirect_to phr_fitness_path(@fitness.phr, @fitness)
    	else
      		render 'new'
   		end
	end

	def show
		@phr = Phr.find(params[:phr_id])
		@fitness = @phr.fitnesses.find(params[:id])
	end

	private
		def fitness_params
			params.require(:fitness).permit(:weight,
											:height,
											:date)
		end
end
