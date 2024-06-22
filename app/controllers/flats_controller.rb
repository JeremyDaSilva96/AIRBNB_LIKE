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
end
