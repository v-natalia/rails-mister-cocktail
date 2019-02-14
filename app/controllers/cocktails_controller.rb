class CocktailsController < ApplicationController
  def index         # GET /cocktails
    @cocktails = Cocktail.all
  end

  def show          # GET /cocktails/:id
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new           # GET /cocktails/new
    @cocktail = Cocktail.new
  end

  def create        # POST /cocktails
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end

  # POST create
  #   with valid params
  #     creates a new Cocktail (FAILED - 2)
  #     assigns a newly created cocktail as @cocktail (FAILED - 3)
  #     redirects to the created cocktail (FAILED - 4)

