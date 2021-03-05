class BicyclesController < ApplicationController
    #before_action :set_bicycle, only: [:show, :edit, :update, :destroy]
    def index
        @bicycles = Bicycle.all
    end

    def show
        @bicycle = Bicycle.find(params[:id])
    end

    def new
        @bicycle = Bicycle.new
    end
    
    def create
       @bicycle = Bicycle.new(bicycle_params)
       @bicycle.user = current_user
       if @bicycle.save
            redirect_to bicycle_path(@bicycle)
        else
            render 'new'
        end
    end

    def edit
    end

    #def destroy
        #@bicycle = Bicycle.find(params[:id])
        #@user.destroy
        #redirect_to user_path(@b
        #how to redirect user page?
    #end

    private
    #def set_bicycle
        #@bicycle = Bicycle.find(params[:id])
      #end

    def bicycle_params
        params.require(:bicycle).permit(:activity, :brand, :model, :size, :specs, :gender, :pickup, :price, :description)
    end
end
