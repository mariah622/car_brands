class CarsController < ApplicationController
    before_action :redirect_to_logged_in?
    
    layout 'car'

    def index
        if params[:brand_id] &&  @brand = Brand.find_by_id(params[:brand_id])
            @cars = @brand.cars
        else 
            @cars = Car.order_by_price
        end 
    end 

    def show
        @car = Car.find_by_id(params[:id])
    end 

    def new 
        if params[:brand_id] &&  @brand = Brand.find_by_id(params[:brand_id])
            # @shoe = Shoe.new(brand_id: params[:brand_id])
            @car = @brand.cars.build
        else
            @car = Car.new
            @car.build_brand
        end
    end 
    
    def create 
        @car = Car.new(car_params)     
        @car.user = current_user
        if params[:brand_id]
            @brand = Brand.find_by_id(params[:brand_id])
        end
        if @car.save
            redirect_to cars_path
        else
            render :new
        end
    end

    def edit
        @car = Car.find_by_id(params[:id])
    end 

    def update
        @car = Car.find_by_id(params[:id])
        @car.update(car_params)
        if @car.valid?
            redirect_to car_path(@car)
        else 
            render :edit
        end 
    end 
    
    def destroy
        @car = Car.find_by_id(params[:id])
        @car.destroy
        redirect_to cars_path
    end 
    
    private
    def car_params
        params.require(:car).permit(:name, :year, :price, :condition, :color, :brand_id, brand_attributes: [:name, :year_created])
    end




end
