class Task < ApplicationRecord
  belongs_to :project

  validates :title, :project_id, :presence => true
  validates :is_done, :inclusion => { :in => [true, false] }

  scope :due_this_week, -> {}
  scope :late, ->{where('due_date < ?', Time.now)}
end
