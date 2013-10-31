
require 'spec_helper'

describe StandaloneTypograf do

  describe 'implementation' do 
    it 'registers processors' do
      described_class.processors.length.should > 0
    end
  end
end
