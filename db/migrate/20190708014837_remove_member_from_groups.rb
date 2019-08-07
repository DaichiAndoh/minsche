class RemoveMemberFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_reference :groups, :member, foreign_key: true
  end
end
