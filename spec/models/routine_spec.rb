# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Routine, type: :model do
  subject { create(:routine) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
