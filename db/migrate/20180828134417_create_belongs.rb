class CreateBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :belongs do |t|
      t.references :course, foreign_key: true
      t.references :degree, foreign_key: true

      t.timestamps
    end
  end
end
