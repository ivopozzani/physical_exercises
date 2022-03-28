# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Routine, type: :model do
  subject { create(:routine) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:exercises) }
  end
end
