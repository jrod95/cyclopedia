class ReviewsController < ApplicationController

  def create
    @bicycle = Bicycle.find(params[:id])
    @review = Review.new(review_params)
    @review.bicycle = @bicycle
    if @review.save
      redirect to bicycle_path(@bicycle)
    else
      render 'bicycles/show'
    end
  end


  private
  def review_params
    params.require(:review).permit(:content)
  end

end
