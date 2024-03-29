class BicyclesController < ApplicationController

    def index
        if params[:query].present?
          @bicycles = Bicycle.search_by_brand_model_and_activity(params[:query])
        else
          @bicycles = Bicycle.all
        end
    end

    def show
        @bicycle = Bicycle.find(params[:id])
        @booking = Booking.new
        @review = Review.new
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
        params.require(:bicycle).permit(:activity, :brand, :model, :size, :specs, :gender, :pickup, :price, :description, :photo)
    end
end
