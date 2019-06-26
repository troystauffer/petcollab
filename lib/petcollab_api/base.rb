require 'httparty'

module PetcollabAPI
  module Base
    include HTTParty
    debug_output $stdout

    def process_response(res)
      return false if (res.code >= 400)
      JSON.parse(res.body)['response']
    end
  end
end
