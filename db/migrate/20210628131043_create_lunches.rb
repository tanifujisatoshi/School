class CreateLunches < ActiveRecord::Migration[6.0]
  def change
    create_table :lunches do |t|

      t.timestamps
    end
  end
end
