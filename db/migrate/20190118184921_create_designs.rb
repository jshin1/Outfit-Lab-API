class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :shirtType
      t.string :shirtColor
      t.string :pocketColor
      t.string :ringer
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
