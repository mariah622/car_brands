class CustomizationsController < ApplicationController
    before_action :redirect_to_logged_in?

    def index
        # @customizations = Customization.all
        @customizations = current_user.customizations

    end 
    
    def show
        @customization = Customization.find_by_id(params[:id])
    end 

    def new
        @customization = Customization.new

    end 
    
    def create
        @customization = Customization.new(customization_params)     
        # @customization.car.user = current_user

        if @customization.save
            redirect_to customizations_path
        else
            render :new
        end
    end

    def edit
        @customization = Customization.find_by_id(params[:id])
        redirect_if_not_authorized
    end 

    def update
        @customization = Customization.find_by_id(params[:id])
        @customization.update(customization_params)
        if @customization.valid?
            redirect_to customization_path(@customization)
        else 
            render :edit
        end 
    end 

    def destroy
        @customization = Customization.find_by_id(params[:id])
        @customization.destroy
        redirect_to customizations_path
    end 

    private
    def customization_params
        params.require(:customization).permit(:part, :color, :car_id, cars_attributes: [:name, :year, :price, :condition, :color])
    end 

    def redirect_if_not_authorized
        if @customization.car.user != current_user
            redirect_to customizations_path
        end 
    end 




end 