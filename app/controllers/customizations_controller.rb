class CustomizationsController < ApplicationController
    before_action :redirect_to_logged_in?
    before_action :find_customization, only: [:show, :update, :edit, :destroy]

    def index
        @customizations = current_user.customizations
    end 
    
    def show
    end 

    def new
        @customization = Customization.new

    end 
    
    def create
        @customization = Customization.new(customization_params)     

        if @customization.save
            redirect_to customizations_path
        else
            render :new
        end
    end

    def edit
        redirect_if_not_authorized
    end 

    def update
        @customization.update(customization_params)
        if @customization.valid?
            redirect_to customization_path(@customization)
        else 
            render :edit
        end 
    end 

    def destroy
        @customization.destroy
        redirect_to customizations_path
    end 

    private
    def customization_params
        params.require(:customization).permit(:part, :color, :car_id, cars_attributes: [:name, :year, :price, :condition, :color])
    end 

    def find_customization
        @customization = Customization.find_by_id(params[:id])
    end 

    def redirect_if_not_authorized
        if @customization.car.user != current_user
            redirect_to customizations_path
        end 
    end 




end 