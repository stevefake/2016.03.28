require 'net/http'
require 'json'
require 'pry'

# https://api.github.com/repos/stevefake/2016.03.28/issues/1

class Issueone

  # attr_reader :user
  #   def initialize#(user, pword)
  #     # @user = user
  #     # @pword = pword
  #   end

ENDPOINT = "https://api.github.com/repos/stevefake/2016.03.28/issues"

  def list_issue  #(gist_issue)
    response = query_list
    return JSON.parse(response)
  end
  def query_list
    uri = URI(ENDPOINT)
    # Build client
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    # Build request
    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth(ENV['GITHUB_USER'], ENV['GITHUB_PASSWORD'])

    # Actually Perform the request
    response = http.request(req).body
    # response = request.body = {"state" : "closed"}.to_json

  end

end
