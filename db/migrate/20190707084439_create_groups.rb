class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :introduction
      t.string :image
      t.integer :code
      t.string :password_digest
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
