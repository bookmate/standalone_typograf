
require 'spec_helper'

describe StandaloneTypograf::Typograf do

  describe 'options validation' do
    def with_otion(key, value)
      described_class.new('', key => value) 
    end

    it { expect { with_otion(:mode, :plain) }.to raise_error(ArgumentError) }
  end

  describe 'modes' do 
    it 'has UTF-mode by default' do
      t = described_class.new('')
      t.mode.should == :utf
    end

    it 'can be passed as param' do
      t = described_class.new('', mode: :html)
      t.mode.should == :html
    end
  end
end
