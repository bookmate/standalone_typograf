# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StandaloneTypograf::Fractions::Processor do
  it 'works on Html mode' do
    expect(described_class.compile(' 134/334', :html)).to eq ' <sup>134</sup>&frasl;<sub>334</sub>'
  end

  it 'does not on Utf mode' do
    expect(described_class.compile('2/4', :utf)).to eq '2/4'
  end

  it 'does not when last char is not space' do
    expect(described_class.compile('2/4*', :html)).to eq '2/4*'
  end
end
