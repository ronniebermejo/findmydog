class Api::V1::PetController < ApiController

  def index
    if  params[:name]
      @pet = Pet.where(:name => params[:name] )
    else
      @pet = Pet.all
    end

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
    @pet = Pet.new(pet_params)
    if @pet.save
      format.json { render json: @pet, status: 201  }
    else
      render json: {
          message: 'Error while saving pet',
          errors: @pet.errors.full_messages
      }, status: 442
    end

  end

  def sort
    parameter = params["sort"]
    Pet.where("DESC by", parameter)

  end

  def destroy
    Pet.find(params[:id]).destroy
    head :ok
  end

  private

  def pet_params
    {
      name: params[:name],
      comments: params[:comments],
      image: params[:image],
      place: params[:place],
      owner: params[:owner],
    }
  end

  def image_url
    Image.find(@pet.image_url)
  end

  def owner
    Owner.find_or_create_by(name: params[:name])
  end


end
