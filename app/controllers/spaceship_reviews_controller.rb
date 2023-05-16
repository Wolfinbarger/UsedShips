class SpaceshipReviewsController < ApplicationController
  def new
    @review = SpaceshipReview.new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @review = SpaceshipReview.new(spaceship_review_params)
    @review.spaceship = @spaceship

    if @review.save
      redirect_to spaceship(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    Spaceship.find(:id).destroy
  end

  private

  def spaceship_review_params
    require(:spaceship_review).permit(:comment, :spaceship_id, :user_id)
  end
end