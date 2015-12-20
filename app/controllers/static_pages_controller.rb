class StaticPagesController < ApplicationController
  def home
  	@places = Place.all
  	@places.sort_by! {|a|  a.hot}
  	@places.reverse!
  end

  def help
  end

  def about
  end
end
