class FoodsController < ApplicationController
  before_action :authenticate_user!

  def show
    @food = Food.find(params[:id])
    @food_new = Food.new
    @review = FoodComment.new
    @user = @food.user
    @food_comment = FoodComment.new
  end

  def index
    @foods = Food.all
    @food = Food.new
    @user = current_user
    @food_comments = FoodComment.all
    @all_ranks = Food.find(Favorite.group(:food_id).order('count(food_id) desc').limit(10).pluck(:food_id))
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      tags = Vision.get_image_data(@food.food_image)
      tags.each do |tag|
        @food.tags.create(name: tag)
      end
      redirect_to food_path(@food.id), notice: "投稿が完了しました"
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
      tags = Vision.get_image_data(@food.food_image)
      @food.tags.destroy_all
      tags.each do |tag|
        @food.tags.create(name: tag)
      end
      redirect_to food_path(@food), notice: "投稿を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: "投稿を削除しました"
  end

  private

  def food_params
    params.require(:food).permit(:title, :body, :food_image)
  end
end
