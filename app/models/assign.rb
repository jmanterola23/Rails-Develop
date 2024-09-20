class Assign < ApplicationRecord
  belongs_to :room
  belongs_to :meet

  validates :start_time, :end_time, presence: true
end

