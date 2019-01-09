# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StandaloneTypograf do
  describe 'implementation' do
    it 'registers processors' do
      expect(described_class.processors.length).to be > 0
    end
  end
end
