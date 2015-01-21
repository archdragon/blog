class Post < ActiveRecord::Base
  belongs_to :user
  has_one :image

  acts_as_taggable
  
  extend FriendlyId
  friendly_id :title, use: :slugged
end
