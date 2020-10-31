class FoodsController < ApplicationController
  before_action :authenticate_user!

  def show
    @food = Food.find(params[:id])
    @food_new = Food.new
    @user = @food.user
    @food_comment = FoodComment.new
  end

  def index
    @foods = Food.all
    @food = Food.new
    @user = current_user
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to food_path(@food.id), notice: "You have created ramen successfully."
    else
      @foods = Food.all
      @user = current_user
      render 'index'
    end
  end

  def edit
    @food = Food.find(params[:id])
    if @food.user == current_user
    else
      redirect_to foods_path
    end
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to food_path(@food), notice: "You have updated ramen successfully."
    else
      render "edit"
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:title, :body)
  end
end
