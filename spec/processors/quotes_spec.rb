# encoding: UTF-8

require 'spec_helper'

describe StandaloneTypograf::Quotes::Processor do

  def typograf(text, mode)
    described_class::compile(text, mode)
  end

  texts = {
    :utf => [
      ['Он сказад: "Привет, Михалыч"', 'Он сказад: «Привет, Михалыч»']
    ],
    :html => [
      ['"Привет"', '&laquo;Привет&raquo;' ],
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
