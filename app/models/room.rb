class Room < ApplicationRecord
    has_many :assigns
    has_many :meets, through: :assigns
  end
  