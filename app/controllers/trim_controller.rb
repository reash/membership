class TrimController < ApplicationController
  def index
    @trims = Trim.all.sort
  end
  def new
  end
  private
    def trim_params
      params.require(:trim).permit(:name, :language, :value, :notes )
    end

end
