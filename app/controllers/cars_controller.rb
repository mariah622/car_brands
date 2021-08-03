class CarsController < ApplicationController
    def index
        @cars = Car.all
    end 

    def show
        @car = Car.find_by_id(params[:id])

    end 

    def new 
    end 
    
    def create
        byebug
    end 

    def edit
    end 

    def destroy
    end 

    private
    def car_params
        # params.require(:car).permit{:name,}
    end 
end
