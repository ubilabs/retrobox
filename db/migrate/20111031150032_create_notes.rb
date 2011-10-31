class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :text
      t.boolean :unsolved
      t.string :type
      t.references :user

      t.timestamps
    end
    add_index :notes, :user_id
  end
end
