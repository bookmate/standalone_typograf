
require 'spec_helper'

describe StandaloneTypograf::Signs::Processor do

  def typograf(text, mode)
    described_class::compile(text, mode)
  end

  texts = {
    # in <b>utf</b> section please test signs on English
    :utf => [
      ['Cafero (c) 2013', 'Cafero © 2013']
    ],
    # in <b>html</b> section please test signs on Russian
    :html => [
      ['(tm) Windows', '&trade; Windows']
    ]
  }

  it 'works' do 
    texts.each_pair do |mode, array|
      array.each do|text_pair|  
        typograf(text_pair[0], mode).should == text_pair[1]
      end
    end 
  end
end
