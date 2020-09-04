class CreateKartes < ActiveRecord::Migration[6.0]
  def change
    create_table :kartes do |t|
      t.integer :karte_id,      null: false
      t.string  :patient_name,      null: false
      t.text    :birth_date,   null: true
      t.string     :tel,                       null: true
      t.string     :post_num,    default: "",  null: true
      t.integer    :prefecture_id,                null: false
      t.string     :city,        default: ""
      t.string     :house_num,   default: ""
      t.string     :apart_name,  default: ""
      t.string    :key_person,   null: true
      t.string    :kp_tel,   null: true
      t.string    :main_disease,   null: false
      t.string    :sub_disease,   null: true
      t.string    :main_doctor,   null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
