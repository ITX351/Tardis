class PlaceclassifiesController < ApplicationController
  before_filter :set_placeclassify, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @placeclassifies = Placeclassify.all
    respond_with(@placeclassifies)
  end

  def new
    @placeclassify = Placeclassify.new
    respond_with(@placeclassify)
  end

  def edit
  end

  def create
    @placeclassify = Placeclassify.new(params[:placeclassify])
    @placeclassify.save
    respond_with(@placeclassify)
  end

  def update
    @placeclassify.update_attributes(params[:placeclassify])
    respond_with(@placeclassify)
  end

  def destroy
    @placeclassify.places.update_all(placeclassify_id: 0) #reset to unclassified
    @placeclassify.destroy
    respond_with(@placeclassify)
  end

  private
    def set_placeclassify
      @placeclassify = Placeclassify.find(params[:id])
    end
end
