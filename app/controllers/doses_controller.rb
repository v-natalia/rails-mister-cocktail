class DosesController < ApplicationController
  def show       # GET /doses/:id
    @dose = Dose.find(params[:id])
    @cocktail.dose = Cocktail.find(params[:id])
  end

  # def new           # GET /doses/new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  # end

  def create        # POST /doses
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy       # DELETE /doses/:id
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_dose_path
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
