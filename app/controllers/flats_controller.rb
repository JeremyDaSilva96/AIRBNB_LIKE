class FlatsController < ApplicationController

  def index
    @flats = Flat.all
    if params[:query].present?
      sql_subquery = <<-SQL
        title ILIKE :query OR
        address ILIKE :query OR
        city ILIKE :query OR
        country ILIKE :query OR
        CAST(price_per_night AS TEXT) ILIKE :query OR
        CAST(number_of_guests AS TEXT) ILIKE :query
      SQL
      @flats = @flats.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
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
    params.require(:flat).permit(:title, :address, :city, :zip_code, :country, :description, :price_per_night, :number_of_guests, :photo)
  end
end
