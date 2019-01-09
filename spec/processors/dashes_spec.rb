# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StandaloneTypograf::Dashes::Processor do
  def typograf(text, mode)
    described_class.compile(text, mode)
  end

  texts = {
    utf: [
      ['Сушка - процесс удаления влаги', 'Сушка — процесс удаления влаги'],
      ['- А что Казбич? – спросил я', '— А что Казбич? — спросил я']
    ],
    html: [
      ['Вода - бинарное неорганическое соединение', 'Вода &mdash; бинарное неорганическое соединение'],
      ['- Как пройти в библиотеку?', '&mdash; Как пройти в библиотеку?'],
      ['1-1=0', '1-1=0'], # no changes
      ['-1', '-1'] # no changes
    ]
  }

  texts.each_pair do |mode, array|
    array.each do |text_pair|
      it "works in mode '#{mode}' on '#{text_pair.first}'" do
        expect(typograf(text_pair[0], mode)).to eq text_pair[1]
      end
    end
  end
end
