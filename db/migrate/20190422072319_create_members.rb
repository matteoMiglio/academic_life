class CreateMembers < ActiveRecord::Migration[5.2]
  def up
    create_table :members do |t|
      t.string :membership
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :members
  end
end