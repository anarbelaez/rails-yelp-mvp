class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    # Find restaurant
    @review = Review.new
  end

  def create
    # Find restaurant
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
