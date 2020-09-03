class CreateKartes < ActiveRecord::Migration[6.0]
  def change
    create_table :kartes do |t|
      t.integer :karte_id
      t.string  :patient_name,      null: false
      t.text    :birth_date,   null: false
      t.string     :tel,                       null: false
      t.string     :post_num,    default: "",  null: false
      t.integer    :prefecture_id,                null: false
      t.string     :city,        default: ""
      t.string     :house_num,   default: ""
      t.string     :apart_name,  default: ""
      t.string    :key_person,   null: false
      t.string    :kp_tel,   null: false
      t.string    :main_disease,   null: false
      t.string    :sub_disease,   null: false
      t.string    :main_doctor,   null: false
      t.timestamps
    end
  end
end
