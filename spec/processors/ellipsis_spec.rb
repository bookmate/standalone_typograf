# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StandaloneTypograf::Ellipsis::Processor do
  def typograf(text, mode)
    described_class.compile(text, mode)
  end

  texts = {
    utf: [
      ['He was sleeping... Hey! You..', 'He was sleeping… Hey! You..']
    ],
    html: [
      ['Он молчал... ', 'Он молчал&hellip; '],
      ['1...3', '1...3'] # should not work with digits
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
