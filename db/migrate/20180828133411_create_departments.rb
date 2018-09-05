class CreateDepartments < ActiveRecord::Migration[5.2]
  def up
    create_table :departments do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :departments
  end
end
