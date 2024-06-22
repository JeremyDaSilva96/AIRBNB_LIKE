class FlatsController < ApplicationController

  def index
    @flats = Flat.all

    if params[:query].present?
      query = "%#{params[:query]}%"
      @flats = @flats.where(
        "title ILIKE :query OR
         address ILIKE :query OR
         CAST(price_per_night AS TEXT) ILIKE :query OR
         CAST(number_of_guests AS TEXT) ILIKE :query",
        query: query
      )
    end
  end
end
