class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
    
  default_scope :order => 'microposts.created_at DESC'
  
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private
  
  def self.followed_by(user)
    #user.following returns massive array.
     #can map out the id, using short hand user.following.map(&:id).join(", ")
     #SQL wants it in csv format
     #expensive though so refactored to:
     followed_ids = %(SELECT followed_id FROM relationships WHERE follower_id = :user_id)
     where("user_id IN (#{followed_ids}) OR user_id = :user_id", :user_id => user)   
  end

  
end

# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

