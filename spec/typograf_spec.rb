
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

  describe '.processors' do
    it 'raises an error on unknown processor' do
      t = described_class.new('')
      expect { t.processor(:unknown) }.to raise_error(ArgumentError)
    end

    it 'response on separate processor' do
      t = described_class.new('Типограф - это круто, +-', mode: :html)
      t.processor(:mnemonics).should == 'Типограф - это круто, &plusmn;'
    end    

    it 'response on several processors' do
      shoulda = 'Типограф &mdash; это круто, &plusmn;'
      t = described_class.new('Типограф - это круто, +-', mode: :html)
      t.processor(:mnemonics, :dasherize).should == shoulda
      t.prepare.should == shoulda
    end
  end
end
