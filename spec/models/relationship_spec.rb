require 'rails_helper'

RSpec.describe Relationship, type: :model do
  include_context "relationship setup"
  
  # グループを作成したメンバーが管理者になること
  it "promises that group creator become group admin" do
    member.be_first_creator(group)
    
    expect(group.first_creator_id).to eq member.id
  end
  
  # メンバーはグループに参加できること
  it "promises that member can join groups" do
    member.join_group(group.code, group.password)
    
    relationship = member.relationships.find_by(group_id: group.id)
    
    expect(relationship.group_id).to eq group.id
  end
  
  # メンバーはコードが一致しなければグループに参加できないこと
  it "doesn't allow member to join groups if code is wrong" do
    member.join_group(111, group.password)
    
    expect(member.relationships.length).to eq 0
  end
  
  # メンバーはパスワードが一致しなければグループに参加できないこと
  it "doesn't allow member to join groups if password is wrong" do
    member.join_group(group.code, "aaa")
    
    expect(member.relationships.length).to eq 0
  end
end