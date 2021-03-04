class BicyclesController < ApplicationController

 before_action :set_bicycle, only: [:show, :edit, :update, :destroy]

def new
  @bicycle = Bicycle.new
  authorize @bicycle
end

def index
  @bicycles = policy_scope(Bicycle)
end


def create
  @bicycle = Bicycle.new(bicycle_params)
  authorize @bicycle
  @bicycle.user = current_user

  if @bicycle.save
    redirect_to @bicycle, notice: "Bicycle was successfully created"

  else
    render :new
  end
end

def show
  authorize @bicycle
end

def update
  authorize @bicycle
  if @bicycle.update(bicycle_params)
  redirect_to @bicycle, notice "Bicycle was updated"
  else
  render :edit
  end
end

def destroy
  @bicycle.destroy
  authorize @bicycle
end


private

    # Use callbacks to share common setup or constraints between actions.
    def set_bicycle
      @bicycle = Bicycle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bicycle_params
      params.require(:type, :brand, :model, :size).permit(:type, :brand, :model, :size)
    end
end

