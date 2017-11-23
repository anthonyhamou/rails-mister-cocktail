class DosesController < ApplicationController

  before_action :set_cocktail, only: :create
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # binding.pry
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      # nouvelle requete HTTP
      redirect_to cocktail_path(@cocktail)
    else
      # afficher les erreurs si on a pas bien rempli le form
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
