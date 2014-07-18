class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  def new_member
    params.permit(:family_id)
    family_id = params[:family_id]
    @family = Family.find(family_id)
    @member = Member.new
    @member.last_name = @family.name
    @relationships = Relationship.all.sort
  end
  
  # GET /members/new
  def new_family_member
    params.permit(:family_id)
    @member = Member.new
    @member = params[:family_id]
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create_family_member
    params.permit(:family_id)
    family_id = params[:family_id]
    params.permit(:first_name)
    first_name = params[:first_name]
    params.permit(:middle_name)
    middle_name = params[:middle_name]
    params.permit(:last_name)
    last_name = params[:last_name]
    params.permit(:gender)
    gender = params[:gender]
    params.permit(:relationship)
    relationship = params[:relationship]
    params.permit(:member)
    member = params[:member]
    b = member[:birthday]
    birthday = Date.new(member['birthday(1i)'].to_i, member['birthday(2i)'].to_i, member['birthday(3i)'].to_i)

    @member = Member.new
    @member.first_name = first_name
    @member.middle_name = middle_name
    @member.last_name = last_name
    if gender == 'Male'
      @member.male = true
    else
      @member.male = false
    end
    @member.birthday = birthday
    @member.relationship = relationship
    @member.family_id = family_id
    if(@member.save!)
      flash[:success] = "Member #{first_name} #{last_name} saved."
      redirect_to :controller => :families, :action => :edit_top_family, :id => family_id
    else
      flash[:error] = "Member #{first_name} #{last_name} Not Saved!"
      redirect_to :controller => :members, :action => :new_member, :family_id => family_id
    end

    
  end
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  def edit_member
    params.permit(:id)
    id = params[:id]
    @member = Member.find(id)
    @family = Family.find(@member.family_id)
    @relationships = Relationship.all.sort
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:family_id, :first_name, :middle_name, :last_name)
    end
end
