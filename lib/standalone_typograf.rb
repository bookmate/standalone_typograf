require 'active_support'
require 'standalone_typograf/version'

module StandaloneTypograf
  extend ActiveSupport::Autoload

  @@processors = []

  class << self
    def register_processor(klass)
      @@processors << klass
    end

    def processors
      @@processors
    end
  end

  eager_autoload do
    autoload :Dasherize
  end

  include Dasherize
  
  class Typograf
    attr_accessor :text

    def initialize(text, options={})
      @text = text
    end
  end
end
