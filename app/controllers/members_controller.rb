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
    member_params
    @member = Member.new
    populate_member
    params.permit(:family_id)
    family_id = params[:family_id]
    params.permit(:gender)
    gender = params[:gender]
    params.permit(:birth)
    birth = params[:birth]
    birthday = Date.new(birth['birthday(1i)'].to_i, birth['birthday(2i)'].to_i, birth['birthday(3i)'].to_i)

    @member = Member.new

    populate_member

    if gender == 'Male'
      @member.male = true
    else
      @member.male = false
    end
    @member.birthday = birthday
    @member.family_id = family_id
    if(@member.save!)
      flash[:success] = "Member #{@member.first_name} #{@member.last_name} Created."
      redirect_to :controller => :families, :action => :edit_top_family, :id => family_id
    else
      flash[:error] = "Member #{@member.first_name} #{@member.last_name} Not Created!"
      redirect_to :controller => :members, :action => :new_member, :family_id => family_id
    end

    
  end

  def update_family_member
    params.permit(:member_id)
    member_id = params[:member_id]
    @member = Member.find(member_id)
    member_params
    populate_member
    params.permit(:family_id)
    family_id = params[:family_id]
    params.permit(:gender)
    gender = params[:gender]
    params.permit(:birth)
    birth = params[:birth]
    birthday = Date.new(birth['birthday(1i)'].to_i, birth['birthday(2i)'].to_i, birth['birthday(3i)'].to_i)

    if gender == 'Male'
      @member.male = true
    else
      @member.male = false
    end
    @member.birthday = birthday
    @member.relationship = relationship
    @member.family_id = family_id
    if(@member.save!)
      flash[:success] = "Member #{@member.first_name} #{@member.last_name} Updated."
      redirect_to :controller => :families, :action => :edit_top_family, :id => family_id
    else
      flash[:error] = "Member #{@member.first_name} #{@member.last_name} Not Updated!"
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
    id = @member.id
    if @member.destroy
      flash[:success] = 'Member Deleted'
    else
      flash[:error] = 'Member Not Delete'
    end
    redirect_to :controller => :families, :action => :edit_top_family, :id => id
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

    def populate_member
      m = params[:member]
      m.each_pair do |a,b|
        @member[a] = m[a]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:family_id, :first_name, :middle_name, :last_name, :relationship)
    end
end
