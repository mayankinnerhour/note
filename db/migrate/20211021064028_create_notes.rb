class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
