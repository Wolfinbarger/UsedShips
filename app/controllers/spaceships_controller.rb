class SpaceshipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @spaceships = Spaceship.all
    if params[:query].present?
      @spaceships = @spaceships.search(params[:query])
    end
    if params[:filter]
      case params[:filter]
      when 'Capacity'
        @spaceships = @spaceships.order(crew: :desc)
      when 'High Price'
        @spaceships = @spaceships.order(rate: :desc)
      when 'Low Price'
        @spaceships = @spaceships.order(rate: :asc)
      when 'Top Spead'
        @spaceships = @spaceships.order(speed: :desc)
      when 'Low Spead'
        @spaceships = @spaceships.order(speed: :asc)
      when 'Max Weight'
        @spaceships = @spaceships.order(max_weight: :desc)
      end
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
    @booking = Booking.new
    # authorize(@spaceship)
  end

  def new
    @spaceship = Spaceship.new
    # authorize(@spaceship)
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    # authorize(@spaceship)

    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spaceship = Spaceship.find(params[:id])
    # authorize(@spaceship)
  end

  def update
    @spaceship = Spaceship.find(params[:id])
    # authorize(@spaceship)

    if @spaceship.update(spaceship_params)
      redirect_to spaceship_path(@spaceship)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @spaceship = Spaceship.find(params[:id])
    # authorize(@spaceship)
    @restaurant.destroy
    redirect_to spaceships_path, status: :see_other
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :speed, :armaments, :size, :max_weight, :crew, :features, :location, :description, :language, :ship_model, :rate, :photo)
  end
end
