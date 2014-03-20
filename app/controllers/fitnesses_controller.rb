class FitnessesController < ApplicationController
	def index
		@phr = Phr.find(params[:phr_id])
		@fitnesses = @phr.fitnesses
	end

	def new
		@phr = Phr.find(params[:phr_id])
		@fitness = @phr.fitnesses.build
	end


end
