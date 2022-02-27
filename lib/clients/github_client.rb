class GithubClient
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new(personal_access_token: ACCESS_TOKEN)
  end

  def create_auth
    @http_client.create_authorization(scopes: ['user'], note: 'Name of token',
                                      headers: { 'X-GitHub-OTP' => '<your 2FA token>' })
  end
end
