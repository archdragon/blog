class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  acts_as_taggable

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published,   -> { where(draft: false).order('created_at DESC') }
  scope :unpublished, -> { where(draft:  true).order('created_at DESC') }
end
