class FoodCommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create]

	def create
	# 	food = Food.find(params[:food_id])
	# 	comment = current_user.food_comments.new(food_comment_params)
	# 	comment.food_id = food.id
	# 	comment.save
	# 	redirect_to request.referrer
		@review = FoodComment.new(food_comment_params)
		@review.user_id = current_user.id
		if @review.save
			redirect_to food_path(@review.food)
		else
			@food = Food.find(params[:id])
			render "foods/show"
		end
	end

	def destroy
		FoodComment.find_by(id: params[:id], food_id: params[:food_id]).destroy
		redirect_to request.referrer
	end

	def index
	    @food = Food.find(params[:food_id])
	    @reviews = @food.food_comments
	end

private
    def food_comment_params
    	params.require(:food_comment).permit(:comment, :post_image, :score, :content, :food_id)
    end
end
