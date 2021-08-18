class CarsController < ApplicationController
    before_action :redirect_to_logged_in?
    before_action :find_car, only: [:show, :update, :edit, :destroy]
    
    layout 'car'

    def index
        if params[:brand_id] &&  @brand = Brand.find_by_id(params[:brand_id])
            @cars = @brand.cars
            
            
        else 
            @cars = Car.order_by_price

    
          

        end
        @cars = Car.color_selector(params[:car][:color]) if params[:car] && !params[:car][:color].blank?
        @oldest_car = @brand.cars.oldest_car
    
    end 

    def show 
    end 

    # def oldest_car
    #     @cars = Car.oldest_car
    #     render :index
    # end

    def new 
        if params[:brand_id] &&  @brand = Brand.find_by_id(params[:brand_id])
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
            redirect_to brands_path
        else
            render :new
        end
    end

    def edit
    end 

    def update
        @car.update(car_params)
        if @car.valid?
            redirect_to car_path(@car)
        else 
            render :edit
        end 
    end 
    
    def destroy
        @car.destroy
        redirect_to cars_path 
    end 
    
    private

    def car_params
        params.require(:car).permit(:name, :year, :price, :condition, :color, :brand_id, brand_attributes: [:name, :year_created])
    end

    def find_car
        @car = Car.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
        if @car.user != current_user
            redirect_to cars_path
        end 
    end 

end
