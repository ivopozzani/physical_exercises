# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Routine, type: :model do
  subject { create(:routine) }

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:exercises) }
  end
end
