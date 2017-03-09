class VenuesController < ApplicationController
  def index
    @venues = HotMessModels::Venue.all

    respond_to do |format|
      format.html
      format.json { render json: @venues }
    end
  end

  def show
    @venue = HotMessModels::Venue.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @venue }
    end
  end

  def new
    @locale = HotMessModels::Locale.find(params[:locale_id])

    @venue = CreateVenue.new locale_id: @locale.id

    respond_to do |format|
      format.html
      format.json { render json: @venue }
    end
  end

  def create
    venue = CreateVenue.new venue_params

    @venue = venue.to_model

    if @venue.save
      respond_to do |format|
        format.html { redirect_to @venue }
        format.json { render json: @venue, status: :created, location: @venue }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @venue = HotMessModels::Venue.find(params[:id])
  end

  def update
    @venue = HotMessModels::Venue.find(params[:id])

    @venue.update venue_params.nilify_blanks

    if @venue.save
      respond_to do |format|
        format.html { redirect_to @venue }
        format.json { render status: :accepted, json: @venue, location: @venue }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render status: :unprocessable_entity, json: @venue.errors }
      end
    end
  end

  def delete
    @venue = HotMessModels::Venue.find(params[:id])

    @venue.delete

    respond_to do |format|
      format.html { redirect_to venues_path }
      format.json { head :no_content }
    end
  end

  private
  def venue_params
    params.require(:venue).permit(:locale_id, :name, :display_name, :facebook_id, :google_place_id, :name_override, :hidden)
  end
end
