# frozen_string_literal: true

class Routine < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
