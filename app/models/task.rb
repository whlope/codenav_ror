class Task < ApplicationRecord
  belongs_to :course
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true
  validates :video_url, presence: true, :url => true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ 
end
