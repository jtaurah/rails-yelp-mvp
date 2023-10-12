class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :destroy]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def show
    @reviews = @restaurant.reviews
  end

  # def edit
  #   @restaurant = Restaurant.find(params[:id])
  # end

  # def update
  #   if @restaurant.update(restaurant_params)
  #     redirect_to @restaurant, notice: "Restaurant was successfully updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @restaurant.destroy
  #   redirect_to @restaurant
  # end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
