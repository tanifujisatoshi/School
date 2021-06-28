class CreateLunches < ActiveRecord::Migration[6.0]
  def change
    create_table :lunches do |t|
      t.text :soup,        null: false
      t.text :staple_food, null: false
      t.text :main_dish,   null: false
      t.text :side_dish,   null: false
      t.text :drink,       null: false
      t.text :other,       null: false
      t.date :menu_date,   null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
