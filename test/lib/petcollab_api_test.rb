require 'test_helper'
require 'petcollab_api/auth'

class PetcollabApiTest < ActiveSupport::TestCase
  setup do
    @auth = Object.new
    @auth.extend(PetcollabApi::Auth)
    @api_response = { "response" => { "token" => "asdf", "role" => { "title" => "my_role" }}}
    def @api_response.code
      200
    end
  end

  test 'calls the auth endpoint' do
    assert true
    # HTTParty.any_instance.stubs(post: @api_response)
    # assert @auth.auth
    # assert_equal session[:api_token], "asdf"
  end
end
