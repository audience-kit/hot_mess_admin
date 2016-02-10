class VenuesController < ApplicationController
  def index
    @venues = Venue.all

    respond_to do |format|
      format.html
      format.json { render json: @venues }
    end
  end

  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @venue }
    end
  end

  def new
    @locale = Locale.find(params[:locale_id])

    @venue = Venue.new locale_id: @locale.id

    respond_to do |format|
      format.html
      format.json { render json: @venue }
    end
  end

  def create
    @venue = Venue.new venue_params

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
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])

    @venue.update venue_params

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
    @venue = Venue.find(params[:id])

    @venue.delete

    respond_to do |format|
      format.html { redirect_to venues_path }
      format.json { head :no_content }
    end
  end

  private
  def venue_params
    params.require(:venue).permit(:locale_id, :name, :display_name)
  end
end
