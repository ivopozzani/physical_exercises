# frozen_string_literal: true

class Exercise < ApplicationRecord
  validates :description, presence: true
  validates :intensity, inclusion: { in: 0..10 }
end
