class EventsController < ApplicationController
  def index
    @events = HotMessModels::Event.future

    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  def show
    @event = HotMessModels::Event.find params[:id]

    respond_to do |format|
      format.html
      format.json { render json: @event }
    end
  end

  def new
    @venue = HotMessModels::Venue.find(params[:venue_id])

    @event = HotMessModels::Event.new venue_id: @venue.id

    respond_to do |format|
      format.html
      format.json { render json: @event }
    end
  end

  def create
    @event = HotMessModels::Event.new event_params

    if @event.save
      respond_to do |format|
        format.html { redirect_to @event }
        format.json { render json: @event, status: :created, location: @event }
      end
    end
  end

  def edit
    @event = HotMessModels::Event.find params[:id]

    respond_to do |format|
      format.html
      format.json { render json: @event }
    end
  end

  def update
    @event = HotMessModels::Event.find params[:id]

    @event.update event_params

    if @event.save
      respond_to do |format|
        format.html { redirect_to @event }
        format.json { render json: @event, status: :accepted, location: @event }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = HotMessModels::Event.find params[:id]

    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_path }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    params.require(:event).permit(:venue_id, :name, :display_name)
  end
end
