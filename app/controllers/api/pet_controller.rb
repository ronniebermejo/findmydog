class Api::PetController < ApiController

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

    @pet = Pet.new(pet_params)

    if @pet.save
      render
    else
      render json: {
          message: 'Validation Failed',
          errors: @pet.errors.full_messages
      }, status: 442
    end

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
      reported_as: params[:reported_as],
      image_id: image_id,
      owner: owner,
    }
  end

  def image_url
    Image.where(:id => @pet.image_id )
  end

  def owner

    Owner.find_or_create_by(name: params[:name])

  end




end
