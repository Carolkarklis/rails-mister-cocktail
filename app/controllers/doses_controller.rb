class DosesController < ApplicationController
  before_action :find_cocktail
  def index
    @doses = Dose.all
  end

  def show
    @doses = set_dose
  end

  # GET /restaurants/new
  def new
    @dose = Dose.new
  end

  def create
    @cocktail = find_cocktail
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    cocktail = find_cocktail
    @dose = cocktail.doses.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end

    def find_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
end
