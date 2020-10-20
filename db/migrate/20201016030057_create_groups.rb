class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name,        null: false
      t.integer :user_id,    null: false, foreign_key: true
      #t.references :comment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
