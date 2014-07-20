class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy ]

  # GET /families
  # GET /families.json
  def index
    @families = Family.all
  end

  # GET /families/1
  # GET /families/1.json
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  def new_family
  end

  def update_family
    params.permit(:family_id)
    params.permit(:name)
    params.permit(:boss)
    name = params[:name]
    family_id = params[:family_id]
    boss = params[:boss]
    @family = Family.find(family_id)
    @family.name = name
    if boss
      @family.main_person_id = boss
    end
    unless(@family.save!)
      flash[:error] = 'Family Information Not Saved!'
    else
      flash[:notice] = 'Family Information Saved.'
    end
    redirect_to :controller => :families, :action => :edit_top_family, :id => @family.id
  end

  # GET /families/1/edit
  def edit
  end

  def index_family
    @families = Family.all
  end

  def edit_family
    params.permit(:family_id)
    family_id = params[:family_id]
    @family = Family.find(family_id)
  end

  def edit_top_family
    params.permit(:id)
    id = params[:id]
    @family = Family.find(id)
  end

  # POST /families
  # POST /families.json
  def create
    family_params
    f = params[:family]
    @family = Family.new
    @family.name = f[:name]

    respond_to do |format|
      if @family.save
        format.html { redirect_to @family, notice: 'Family was successfully created.' }
        format.json { render action: 'show', status: :created, location: @family }
      else
        format.html { render action: 'new' }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end
  def create_family
    family_params
    f = params[:family]
    @family = Family.new
    @family.name = f[:name]

    if @family.save
      redirect_to index_family_families_path, notice: 'Family was successfully created.'
    else
      redirect_to new_family_families_path, notice: 'Error in Family Addition.'
    end
  end

  # PATCH/PUT /families/1
  # PATCH/PUT /families/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
      params.require(:family).permit(:name)
    end
end
