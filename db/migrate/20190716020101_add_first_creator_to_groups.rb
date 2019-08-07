class AddFirstCreatorToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :first_creator, foreign_key: { to_table: :members }
  end
end
