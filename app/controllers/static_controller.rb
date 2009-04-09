class StaticController < ApplicationController

  def index
    @maps = Map.all
  end

  def how; end

end
