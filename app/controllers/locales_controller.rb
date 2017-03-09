class LocalesController < ApplicationController

  def index
    @locales = HotMessModels::Locale.all

    respond_to do |format|
      format.html
      format.json { render json: @locales }
    end
  end

  def show
    @locale = HotMessModels::Locale.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @locale }
    end
  end

  def new
    @locale = HotMessModels::Locale.new

    respond_to do |format|
      format.html
      format.json { render json: @locale }
    end
  end

  def create
    @locale = HotMessModels::Locale.new locale_params

    if @locale.save
      respond_to do |format|
        format.html { redirect_to @locale, notice: 'Locale was created successfully.' }
        format.json { render json: @locale, status: :created, location: @locale }
      end
    else
      format.html  { render action: 'new' }
      format.json  { render json: @locale.errors, status: :unprocessable_entity }
    end
  end

  def edit
    @locale = HotMessModels::Locale.find params[:id]

    respond_to do |format|
      format.html
      format.json { render json: @locale }
    end
  end

  def update
    @locale = HotMessModels::Locale.find params[:id]

    @locale.update locale_params

    if @locale.save
      respond_to do |format|
        format.html { redirect_to @locale }
        format.html { render json: @locale, status: created, location: @locale }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: @locale.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @locale = HotMessModels::Locale.find(params[:id])

    @locale.destroy

    respond_to do |format|
      format.html { redirect_to locales_url }
      format.json { head :no_content }
    end
  end

  protected
  def locale_params
    params.require(:locale).permit(:name, :display_name, :google_place_id, :facebook_location_id)
  end
end
