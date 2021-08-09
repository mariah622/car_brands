
class BrandsController < ApplicationController
    def index
        @brands = Brand.all
    end 

    def show
        @brand = Brand.find_by_id(params[:id])
        @cars  = Car.all
    end

    def new 
        @brand = Brand.new
    end 
    
    def create 
        @brand = Brand.new(brand_params)     
        if @brand.save
            redirect_to brands_path
        else
            render :new
        end
    end

    def edit
        @brand = Brand.find_by_id(params[:id])
    end 

    def update
        @brand = Brand.find_by_id(params[:id])
        @brand.update(brand_params)
        if @brand.valid?
            redirect_to brand_path(@brand)
        else 
            render :edit
        end 
    end 
    
    def destroy
        @brand = Brand.find_by_id(params[:id])
        @brand.destroy
        redirect_to brands_path
    end 
    
    private
    def brand_params
        params.require(:brand).permit(:name, :year_created)
    end


end
