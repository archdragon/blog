class Image < ActiveRecord::Base
  has_attached_file :image_file
  validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/
end