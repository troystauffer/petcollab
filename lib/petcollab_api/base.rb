require 'httparty'

module PetcollabAPI
  module Base
    include HTTParty
    debug_output $stdout
  end
end
