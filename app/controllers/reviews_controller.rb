class ReviewsController < ApplicationController

  def create
    @bicycle = Bicycle.find(params[:bicycle_id])
    @review = Review.new(review_params)
    @review.bicycle = @bicycle
    if @review.save
      redirect_to bicycle_path(@bicycle, anchor: "review-#{@review.id}")
    else
      render 'bicycles/show'
    end
  end


  private
  def review_params
    params.require(:review).permit(:content)
  end

end
