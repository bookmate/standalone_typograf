# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StandaloneTypograf::Nbspaces::Processor do
  def typograf(text, mode)
    described_class.compile(text, mode)
  end

  texts = {
    utf: [
      ['В Украине', 'В Украине']
    ],
    html: [
      ['Форточка в окне', 'Форточка в&nbsp;окне'],
      ['Иди по краю', 'Иди по&nbsp;краю'],
      ['Исключительно Великолепно', 'Исключительно&nbsp;Великолепно'],
      ['Пить - здоровью предить', 'Пить&nbsp;- здоровью предить'],
      ['Лес &mdash; источник древесины', 'Лес&nbsp;&mdash; источник древесины']
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
