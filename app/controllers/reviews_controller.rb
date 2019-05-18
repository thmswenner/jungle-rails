class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new allowed_params
    @review.user = current_user
    if @review.save
      redirect_to @product
    else
      redirect_to @product
    end
  end

  def destroy
    @review = Review.find params[:id]
    if @review.destroy
      redirect_to @review.product
    end
  end

  private

    def allowed_params
      params.require(:review).permit(:rating, :description)
    end

end
