class ReviewsController < ApplicationController
  before_action :find_restaurant
  before_action :find_review, only: %i[edit update destroy]

  def new
    # We need @restaurant in our `simple_form_for`
    @review = @restaurant.reviews.build
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    find_restaurant
    @review = Review.find(params[:id])
  end

  def update
    find_restaurant
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @restaurant
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_review
    @review = Review.find(params[:id]) if params[:id]
  end
end
