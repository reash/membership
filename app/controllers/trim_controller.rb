class TrimController < ApplicationController
  before_action :set_trim, only: [:show, :edit, :update, :delete]
  def index
    @trims = Trim.all.sort
  end
  def new
  end
  def create
    trim_params
    trim = params[:trim]
    t = Trim.new
    t.name = trim[:name]
    t.language = trim[:language]
    t.value = trim[:value]
    t.notes = trim[:notes]
    if t.save!
      flash[:success] = 'Trim Created'
      redirect_to :action => :index
    else
      flash[:error] = 'Trim Not Created'
      redirect_to :action => :new
    end

  end
  def edit
  end

  def update
    if @trim.update(trim_params)
      flash[:notice] = "Trim Successfully Updated"
    else
      flash[:error] = "Trim Not Updated"
    end
    redirect_to :controller => :trim, :action => :index
  end

  def delete
    if @trim.destroy
      flash[:success] = 'Trim Deleted'
    else
      flash[:error] = 'Trim Not Deleted'
    end
    redirect_to :controller => :trim, :action => :index
  end

  private
    def trim_params
      params.require(:trim).permit(:name, :language, :value, :notes )
    end

    def set_trim
            @trim = Trim.find(params[:id])
    end

    def populate_trim
      m = params[:trim]
      m.each_pair do |a,b|
        @trim[a] = m[a]
      end
    end
end
