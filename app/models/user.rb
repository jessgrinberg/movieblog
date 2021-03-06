class User < ActiveRecord::Base
	has_secure_password
	has_many :reviews
	has_many :movies
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    validates :first_name, length: { minimum: 2}
    validates :last_name, length: { minimum: 3}
    validates :password, length: { in: 6..20 }
    validates :first_name, :last_name, :email, :avatar, presence: true

end


