class TrimController < ApplicationController
  def index
    @trims = Trim.all.sort
  end
end
