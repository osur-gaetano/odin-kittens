class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    flash.now[:notice] = "There are #{@kittens.size} kittens here!!!!"

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end

  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  
  def create
    @kitten = Kitten.new(kitten_params)
    
    if @kitten.save
      redirect_to @kitten, notice: "Kiten created successfully !"
    else
      flash[:alert]= "Kitten not created "
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Kitten information has been successfully edited!!"
    else
      render :edit, status: :unprocessable_entity, alert: "Kitten details were not updated"
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, status: :see_other, notice: "Kitten deleted!"
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
