class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @review = Review.new(review_params)
    @review.user = @restaurant

    respond_to do |format|
      if @review.save
        format.html { redirect_to user_path(@user) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "users/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end
end
