class CreateApprovals < ActiveRecord::Migration[5.2]
  def up
    create_table :approvals do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :approvals
  end
end
