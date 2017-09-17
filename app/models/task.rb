class Task < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :course
  acts_as_list scope: :course

  #validates :title, presence: true, length: {maximum: 50}
  #validates :description, presence: true
  #validates :video_url, presence: true, :url => true

  def next_task
    course.tasks.where("position > ?", position).first
  end

  def previous_task
    course.tasks.where("position < ?", position).last
  end
end
