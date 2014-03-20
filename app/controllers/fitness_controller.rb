class FitnessController < ApplicationController
	def index
		@phr = Phr.find(params[:phr_id])
		
	end
end
