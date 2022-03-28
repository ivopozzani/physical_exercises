# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Exercise, type: :model do
  subject { create(:exercise) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_inclusion_of(:intensity).in_range(0..10) }
end
