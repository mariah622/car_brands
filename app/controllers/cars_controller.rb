class CarsController < ApplicationController
    def index
        @cars = Car.all
    end 

    def show
        @car = Car.find_by_id(params[:id])
    end 

    def new 
        @car = Car.new
    end 
    
    def create 
        @car = Car.new(car_params)     
        byebug
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
        params.require(:car).permit(:name, :year, :price, :condition, :color)
    end


end
