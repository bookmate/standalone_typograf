# encoding: UTF-8

require 'spec_helper'

describe StandaloneTypograf::Typograf do

  context 'argument errors' do
    describe 'options validation' do
      def with_otion(key, value)
        described_class.new('', key => value)
      end

      it { expect { with_otion(:mode, :stub) }.to    raise_error(ArgumentError) }
      it { expect { with_otion(:exclude, :stub) }.to raise_error(ArgumentError) }
    end
  end

  context 'arguments' do
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

    describe 'exclude' do
      it 'excludes processor' do
        t = described_class.new('', exclude: :dashes)
        t.processors.include?(:dashes).should be_false
      end
    end
  end

  context 'implementation' do
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
        t = described_class.new('Типограф - это круто, +-', mode: :html)
        t.processor(:mnemonics, :dashes).should == 'Типограф &mdash; это круто, &plusmn;'
      end
    end
  end
end
