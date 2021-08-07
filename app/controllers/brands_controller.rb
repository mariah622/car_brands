
class BrandsController < ApplicationController
    def index
        @brands = Brand.all
    end 

    def show
        @brand = Brand.find_by_id(params[:id])
    end 
    
    # private
    # def car_params
    #     params.require(:car).permit(:name, :year, :price, :condition, :color)
    # end


end
