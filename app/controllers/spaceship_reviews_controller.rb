class SpaceshipReviewsController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @user = User.find(current_user.id)
    @spaceship_review = SpaceshipReview.new
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @spaceship_review = SpaceshipReview.new(spaceship_review_params)
    @spaceship_review.spaceship = @spaceship
    @spaceship_review.user = current_user

    if @spaceship_review.save
      redirect_to spaceships_path
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
    params.require(:spaceship_review).permit(:comment, :spaceship_id, :user_id)
  end
end
