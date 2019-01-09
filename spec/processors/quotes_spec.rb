# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StandaloneTypograf::Quotes::Processor do
  def typograf(text, mode)
    described_class.compile(text, mode)
  end

  texts = {
    utf: [
      ['Он сказал: "Привет, Михалыч"', 'Он сказал: «Привет, Михалыч»'],
      [' "Михась! Или "Мишаня", а?!",- крикнул он ', ' «Михась! Или „Мишаня“, а?!»,- крикнул он '],
      ['"Привет тебе, "Путник""', '«Привет тебе, „Путник“»'],
      ['""Гномы", - вскрикнул Бильбо", - сказал Толкиен', '«„Гномы“, - вскрикнул Бильбо», - сказал Толкиен'],
      ['"Один", "Два", "Три"', '«Один», «Два», «Три»']
    ],
    html: [
      ['"Привет"', '&laquo;Привет&raquo;'],
      ['"Два "вида" "кавычек"" "Жесть"', '&laquo;Два &bdquo;вида&ldquo; &bdquo;кавычек&ldquo;&raquo; &laquo;Жесть&raquo;' ]
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
