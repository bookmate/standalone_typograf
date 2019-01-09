# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StandaloneTypograf::Mnemonics::Processor do
  def typograf(text, mode)
    described_class.compile(text, mode)
  end

  texts = {
    # in <b>utf</b> section please test signs on English
    utf: [
      ['Cafero (c) 2013', 'Cafero © 2013'],
      ['iPhone (r)', 'iPhone ®'],
      ['Право -> там', 'Право → там'],
      ['Температура ~= 10', 'Температура ≈ 10']
    ],
    # in <b>html</b> section please test signs on Russian
    html: [
      ['(tm) Windows', '&trade; Windows'],
      ['Принеси +- 1 штуку', 'Принеси &plusmn; 1 штуку'],
      ['Лево <- там', 'Лево &larr; там']
    ]
  }

  it 'works' do
    texts.each_pair do |mode, array|
      array.each do |text_pair|
        expect(typograf(text_pair[0], mode)).to eq text_pair[1]
      end
    end
  end
end
