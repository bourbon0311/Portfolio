class RanksController < ApplicationController

	def monthly
		if params[:pre_preview].present?
	      @target_month = Date.parse(params[:pre_preview]) << 1
	    elsif params[:next_preview].present?
	      @target_month = Date.parse(params[:next_preview]) >> 1
	    else
	      @target_month = Time.current.to_date << 1
		end
	end
end
