class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {flat: flat}),
        marker_html: render_to_string(partial: "marker"),
        # marker_html: render_to_string(partial: "marker", locals: {flat: flat})
      }
    end
    if params[:query].present?
      sql_subquery = <<-SQL
        title ILIKE :query OR
        address ILIKE :query OR
        CAST(price_per_night AS TEXT) ILIKE :query OR
        CAST(number_of_guests AS TEXT) ILIKE :query
      SQL
      @flats = @flats.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :address, :description, :price_per_night, :number_of_guests, photos: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
