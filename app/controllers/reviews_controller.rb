class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new allowed_params
    @review.user = current_user
    if @review.save
      redirect_to @product
    else
      redirect_to @product
  end

  private

    def allowed_params
      params.require(:review).permit(:rating, :description)
    end

end
