# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StandaloneTypograf::Typograf do
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

        expect(t.mode).to eq :utf
      end

      it 'can be passed as param' do
        t = described_class.new('', mode: :html)

        expect(t.mode).to eq :html
      end
    end

    describe 'exclude' do
      it 'excludes processor' do
        t = described_class.new('', exclude: :dashes)

        expect(t.processors.include?(:dashes)).to be false
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

        expect(t.processor(:mnemonics)).to eq 'Типограф - это круто, &plusmn;'
      end

      it 'response on several processors' do
        t = described_class.new('"Типограф" - это круто, +-', mode: :html)

        expect(t.processor(:mnemonics, :quotes)).to eq '&laquo;Типограф&raquo; - это круто, &plusmn;'
      end
    end
  end
end
