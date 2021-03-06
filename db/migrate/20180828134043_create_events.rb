class CreateEvents < ActiveRecord::Migration[5.2]
  def up
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :appointment
      t.string :place
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
