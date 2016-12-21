module PetcollabAPI
  include HTTParty
  debug_output $stdout

  def authenticate!(email, password)
    auth('/auth', { email: email, password: password })
  end

  def authenticate_facebook(code)
    auth('/auth/facebook', { 'code' => params[:code] })
  end

  def user_info
    return false unless session[:api_token]
    response = HTTParty.get("#{ENV['API_URL']}/user", headers: { 'x-access-token' => session[:api_token] })
    process_response response
  end

  private

  def process_response res
    return false if (res.code >= 400)
    JSON.parse(res.body)
  end

  def auth(path, body)
    response = HTTParty.post(ENV['API_URL'] + path, body: body)
    session[:api_token] = body['token'] if (body = process_response response)
  end
end