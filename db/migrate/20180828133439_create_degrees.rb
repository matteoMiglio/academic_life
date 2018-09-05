class CreateDegrees < ActiveRecord::Migration[5.2]
  def up
    create_table :degrees do |t|
      t.string :name
      t.references :department, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :degrees
  end
end
