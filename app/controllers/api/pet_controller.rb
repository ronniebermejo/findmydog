class Api::PetController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # TODO Read about :null_session
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @pet = Pet.all
    respond_to do |format|
      format.json { render json: @pet , root: false}
    end
  end

  def show
    @pet = Pet.find(params[:id])
    respond_to do |format|
      format.json { render json: @pet }
    end
  end

  def create
    pet = Pet.new
    pet.name = params[:name]
    pet.comments = params[:comments]
    pet.reported_as = params[:reported_as]
    pet.owner = Owner.find(current_user.id)
    pet.save!
  end

  def destroy
    Pet.find(params[:id]).destroy
    head :ok
  end

end
