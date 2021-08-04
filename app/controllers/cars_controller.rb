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
        if @car.save
            redirect_to cars_path
        else
            render :new
        end
    end

    private
    def car_params
        params.require(:car).permit(:name, :year, :price, :condition, :color)
    end 

    # def edit
    # end 

    # def destroy
    # end 



end
