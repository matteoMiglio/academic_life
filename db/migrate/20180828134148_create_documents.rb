class CreateDocuments < ActiveRecord::Migration[5.2]
  def up
    create_table :documents do |t|
      t.string :name
      t.string :description
      t.string :path
      t.references :message_board, foreign_key: true
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :documents
  end
end
