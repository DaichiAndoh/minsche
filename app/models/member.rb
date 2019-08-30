class Member < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :relationships
    has_many :groups, through: :relationships, source: :group
    
    def be_first_creator(group)
        group.update_columns(first_creator_id: self.id)
        self.relationships.create(group_id: group.id, is_admin: true)
    end
    
    def join_group(code, password)
        group = Group.find_by(code: code)
        return false if !group
        return false if !group.authenticate(password)
        self.relationships.create(group_id: group.id)
    end
    
    def be_admin(id)
        relationship = self.relationships.find_by(group_id: id)
        unless relationship.is_admin == true
            relationship.is_admin == true
        else
            relationship.is_admin == false
        end
    end
    
    # def join_group(code, passsword)
    #     group = Group.find_by(code: code)
    #     if group && group.authenticate(password)
    #       if self.relationships.create(group_id: group.id)
    #           return true
    #       else
    #           return false
    #       end
    #     else
    #       return false
    #     end
    # end
end
