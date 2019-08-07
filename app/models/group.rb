class Group < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :introduction, presence: true, length: { maximum: 255 }
    validates :code, uniqueness: true
    
    has_secure_password
    mount_uploader :image, ImageUploader
    
    has_many :relationships
    has_many :members, through: :relationships, source: :member
end
