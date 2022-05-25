# frozen_string_literal: true

require_relative "monolith/version"
require "pathname"

module Majestic
  module Monolith
    class Error < StandardError; end

    autoload :CLI,    "majestic/monolith/cli"
    module Templates
      autoload :Alpha,    "majestic/monolith/templates/alpha"
    end

    def self.root
      Pathname.new(__dir__)
    end
  end
end
