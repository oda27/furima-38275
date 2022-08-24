class BuysController < ApplicationController

  def index
    @buy = Buyform.new
  end

  def create
  binding.pry
  end

end
