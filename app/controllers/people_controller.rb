class PeopleController < ApplicationController
  def index
    @people = Person.all create_endpoint
  end

  def show
    @person = Person.find create_endpoint, params[:id]
  end

  def new
    @person = CreatePerson.new
  end

  def create
    @person = CreatePerson.new
    @person.facebook_id = params[:person][:facebook_id]

    return render :new unless @person.valid?

    person_model = @person.to_model

    if person_model.valid?
      person_model.save

      return redirect_to person_model
    end

    render :new
  end

  def edit
    @person = HotMessModels::Person.find params[:id]
  end

  def update
    @person = HotMessModels::Person.find(params[:id])

    @person.update person_params.nilify_blanks

    if @person.save
      respond_to do |format|
        format.html { redirect_to @person }
        format.json { render status: :accepted, json: @person, location: @person }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render status: :unprocessable_entity, json: @person.errors }
      end
    end
  end

  private
  def person_params
    params.require(:person).permit(:sound_cloud, :twitter, :name_override, :order, :locale_id, :instagram, :facebook_id)
  end
end
