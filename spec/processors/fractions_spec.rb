# encoding: UTF-8

require 'spec_helper'

describe StandaloneTypograf::Fractions::Processor do

  it 'works on Html mode' do
    described_class.compile('134/334', :html).should == '<sup>134</sup>&frasl;<sub>334</sub>'
  end

  it 'does not on Utf mode' do
    described_class.compile('2/4', :utf).should == '2/4'
  end

  it 'does not when last char is not space' do
    described_class.compile('2/4*', :html).should == '2/4*'
  end
end
