# frozen_string_literal: true

require "monolith/version"
require "monolith/engine"

module Monolith
  class Error < StandardError; end

  autoload :CLI,    "monolith/cli"
end
