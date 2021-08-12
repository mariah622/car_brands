class CustomizationsController < ApplicationController

    def show
        @bcustomizations = Customization.find_by_id(params[:id])
    end

    def new 
        @Customization = Customization.new
        3.times { @brand.cars.build } 

    end 
    
    def create 
        @customizations = Customization.new(customization_params)

        if @customization.save
            redirect_to cars_path
        else
            render :new
        end
    end

    def edit
        @customization = Customization.find_by_id(params[:id])
    end 

    def update
        @customization = Customization.find_by_id(params[:id])
        if @customization.valid?
            @customization.update(customization_params)
            redirect_to customization_path(@customization)
        else 
            render :edit
        end 
    end 
    
    def destroy
        @customization = Brand.find_by_id(params[:id])
        @brand.destroy
        redirect_to brands_path
    end 
