class BrandsController < ApplicationController
    before_action :redirect_to_logged_in?
    before_action :find_brand, only: [:show, :update, :edit, :destroy]
    
    def index
        @brands = Brand.all
    end 

    def show
    end

    def new 
        @brand = Brand.new
        3.times { @brand.cars.build } 

    end 
    
    def create 
        @brand = Brand.new(brand_params)
        @brand.cars.each do |c|
            c.user = current_user
        end

        if @brand.save
            redirect_to brands_path
        else
            render :new
        end
    end

    def edit
    end 

    def update
        if @brand.valid?
            @brand.update(brand_params)
            redirect_to brand_path(@brand)
        else 
            render :edit
        end 
    end 
    
    def destroy
        @brand.destroy
        redirect_to brands_path
    end 
    
    private
    def brand_params
        params.require(:brand).permit(:name, :year_created, cars_attributes: [:name, :year, :price, :condition, :color, :user_id])
    end

    def find_brand
        @brand = Brand.find_by_id(params[:id])
    end
end  