# frozen_string_literal: true

class Routine < ApplicationRecord
  has_and_belongs_to_many :exercises

  validates :name, presence: true, uniqueness: true
end
