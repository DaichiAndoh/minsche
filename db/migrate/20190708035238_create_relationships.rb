class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :member, foreign_key: true
      t.references :group, foreign_key: true
      t.boolean :is_admin, default: false
      t.boolean :first_creator, default: false

      t.timestamps
      
      t.index [:member_id, :group_id], unique: true
    end
  end
end
