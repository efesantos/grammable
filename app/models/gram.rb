class Gram < ActiveRecord::Base
  validates :message, presence: true
  validates :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
end
