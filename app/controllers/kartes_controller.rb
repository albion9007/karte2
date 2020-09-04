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

  # def index
  #   @kartes = Karte
  # end

  private

  def karte_params
    params.require(:karte).permit(:karte_id, :image, :patient_name, :birth_date, :post_num, :prefecture_id, :city,
                                  :house_num, :apart_name, :tel, :key_person, :kp_tel, :main_disease, :sub_disease, :main_doctor).merge(user_id: current_user.id)
  end
end
