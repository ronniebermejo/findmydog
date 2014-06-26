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
    Pet.create(name: params[:name], comments: params[:comments]).save!
  end

  def destroy
    Pet.find(params[:id]).destroy
    head :ok
  end

end
