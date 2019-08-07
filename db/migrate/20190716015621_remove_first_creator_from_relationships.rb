class RemoveFirstCreatorFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :first_creator, :boolean
  end
end
