class TrimController < ApplicationController
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
  private
    def trim_params
      params.require(:trim).permit(:name, :language, :value, :notes )
    end

end
