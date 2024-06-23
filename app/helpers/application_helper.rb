module ApplicationHelper
  def country_select_options
    ISO3166::Country.all.map { |country| [country.translations['en'], country.alpha2] }
  end
end
