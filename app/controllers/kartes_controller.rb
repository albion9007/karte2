class KartesController < ApplicationController
  def new
    @karte = Karte.new
  end
end
