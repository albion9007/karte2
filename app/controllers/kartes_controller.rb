class KartesController < ApplicationController
  def new
    @karte = Karte.new
  end

  def create
    @karte = Karte.new(karte_params)
    if @karte.valid?
      @karte.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def karte_params
    params.require(:karte).permit(:post_num, :prefecture_id, :city,
                                  :house_num, :apart_name, :tel).merge(user_id: current_user.id)
  end
end
